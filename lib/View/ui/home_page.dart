import 'package:ai_image_generator/View%20Model/bloc/image_generator_bloc.dart';
import 'package:ai_image_generator/View/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageGeneratorBloc imageGeneratorBloc = ImageGeneratorBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageGeneratorBloc.add(
      InitialEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.app_bg_color,
      appBar: AppBar(
        backgroundColor: AppConfig.app_bar_bg_color,
        centerTitle: true,
        title: Text(
          "AI Image Generator",
          style: TextStyle(
            color: AppConfig.app_bar_txt_color,
          ),
        ),
      ),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
      // body: BlocConsumer<ImageGeneratorBloc, ImageGeneratorState>(
      //   bloc: imageGeneratorBloc,
      //   builder: (context, state) {
      //     switch (state.runtimeType) {
      //       default:
      //         return const SizedBox();
      //     }
      //   },
      //   listener: (context, state) {},
      // ),
    );
  }
}
