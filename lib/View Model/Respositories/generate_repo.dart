import 'dart:developer';
import 'dart:typed_data';

import 'package:ai_image_generator/View/config/app_config.dart';
import 'package:dio/dio.dart';

class GenerateRepo {
  static Future<Uint8List?> generateAIImage(String word_txt) async {
    String url = AppConfig.url;
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${AppConfig.api_key}'
    };
    Map<String, dynamic> payload = {
      'prompt': word_txt,
      'style_id': '122',
      'aspect_ratio': '1:1',
      'cfg': '0',
      'seed': '0',
      'high_res_results': '1'
    };

    FormData formData = FormData.fromMap(payload);
    Dio dio = Dio();
    dio.options =
        BaseOptions(headers: headers, responseType: ResponseType.bytes);

    try {
      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        print("Status code ${response.statusCode}");
        log(response.data.runtimeType.toString());
        log(response.data.toString());
        Uint8List uint8list = Uint8List.fromList(response.data);
        return uint8list;
      } else {
        return null;
      }
    } catch (e) {
      print("Fetching Error: ${e.toString()}");
    }
  }
}
