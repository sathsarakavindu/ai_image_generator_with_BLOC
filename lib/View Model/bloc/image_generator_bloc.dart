import 'dart:async';
import 'dart:typed_data';

import 'package:ai_image_generator/View%20Model/Respositories/generate_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_generator_event.dart';
part 'image_generator_state.dart';

class ImageGeneratorBloc
    extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  ImageGeneratorBloc() : super(ImageGeneratorInitial()) {
    on<InitialEvent>(initialEvent);
    on<ImageGenerateButtonClickEvent>(imageGenerateButtonClickEvent);
  }

  FutureOr<void> initialEvent(
      InitialEvent event, Emitter<ImageGeneratorState> emit) {
    emit(
      InitialState(),
    );
  }

  final GenerateRepo repo = GenerateRepo();

  FutureOr<void> imageGenerateButtonClickEvent(
      ImageGenerateButtonClickEvent event,
      Emitter<ImageGeneratorState> emit) async {
    emit(
      ImageGeneratorLoadingState(),
    );
    final enteredValue = event.txt;
    final Uint8List? generated_image =
        await GenerateRepo.generateAIImage(enteredValue);

    emit(
      ImageGeneratorSuccessState(uint8list: generated_image!),
    );
  }
}
