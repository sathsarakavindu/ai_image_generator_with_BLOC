import 'dart:typed_data';

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
  TextEditingController controller = TextEditingController();
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
      body: BlocConsumer<ImageGeneratorBloc, ImageGeneratorState>(
        bloc: imageGeneratorBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case InitialState:
              return SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset(
                              fit: BoxFit.cover,
                              AppConfig.inital_image,
                              height: h * 0.50,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: w * 0.024, right: w * 0.024),
                        height: h * 0.10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "The AI that developed to help you generate what's in your mind into beautiful visual",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: w * 0.024, right: w * 0.024),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: controller,
                          cursorColor: Colors.white,
                          cursorOpacityAnimates: true,
                          decoration: InputDecoration(
                            hintText: "Enter Your Idea",
                            hintStyle: const TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.generating_tokens,
                                color: Colors.black),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                imageGeneratorBloc.add(
                                  ImageGenerateButtonClickEvent(
                                      txt: controller.text),
                                );
                              }
                            },
                            label: const Text(
                              "Generate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.10,
                          ),
                          ElevatedButton.icon(
                            icon:
                                const Icon(Icons.download, color: Colors.black),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent),
                            onPressed: () {},
                            label: const Text(
                              "Download",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            case ImageGeneratorLoadingState:
              return Center(child: Image.asset(AppConfig.loading_giff));
            case ImageGeneratorSuccessState:
              final successState = state as ImageGeneratorSuccessState;
              return SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: successState.uint8list != null
                                ? Image.memory(
                                    successState
                                        .uint8list, // Displaying image from memory
                                    fit: BoxFit.cover,
                                    height: h * 0.50,
                                    width: double.infinity,
                                  )
                                : Image.asset(
                                    AppConfig
                                        .inital_image, // Fallback asset image
                                    fit: BoxFit.cover,
                                    height: h * 0.50,
                                    width: double.infinity,
                                  ),
                            // child: Image.asset(
                            //   fit: BoxFit.cover,
                            //   AppConfig.inital_image,
                            //   height: h * 0.50,
                            //   width: double.infinity,
                            // ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: w * 0.024, right: w * 0.024),
                        height: h * 0.10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "The AI that developed to help you generate what's in your mind into beautiful visual",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: w * 0.024, right: w * 0.024),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: controller,
                          cursorColor: Colors.white,
                          cursorOpacityAnimates: true,
                          decoration: InputDecoration(
                            hintText: "Enter Your Idea",
                            hintStyle: const TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.generating_tokens,
                                color: Colors.black),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                imageGeneratorBloc.add(
                                  ImageGenerateButtonClickEvent(
                                      txt: controller.text),
                                );
                              }
                            },
                            label: const Text(
                              "Generate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.10,
                          ),
                          ElevatedButton.icon(
                            icon:
                                const Icon(Icons.download, color: Colors.black),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent),
                            onPressed: () {},
                            label: const Text(
                              "Download",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            default:
              return const SizedBox();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
