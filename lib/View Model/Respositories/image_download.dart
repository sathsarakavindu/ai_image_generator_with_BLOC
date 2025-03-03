import 'package:flutter/material.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:typed_data';

class ImageDownload {
  Future<void> saveUint8ListImage(Uint8List uint8list) async {
    try {
      String imageName = "${DateTime.now().millisecondsSinceEpoch}.jpg";

      final result = await SaverGallery.saveImage(
        uint8list,
        fileName: imageName,
        androidRelativePath: "Pictures/SavedImages",
        skipIfExists: false,
      );

      // _toastInfo("Image Successfully Downloaded");
    } catch (e) {
      print("Error saving image: $e");
    }
  }

  void toastInfo(String info) {
    print(info);
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }
}
