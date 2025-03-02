import 'dart:async';

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

  FutureOr<void> imageGenerateButtonClickEvent(
      ImageGenerateButtonClickEvent event,
      Emitter<ImageGeneratorState> emit) async {}
}
