part of 'image_generator_bloc.dart';

@immutable
sealed class ImageGeneratorState {}

final class ImageGeneratorInitial extends ImageGeneratorState {}

class InitialState extends ImageGeneratorState {}

class ImageGeneratorLoadingState extends ImageGeneratorState {}

class ImageGeneratorSuccessState extends ImageGeneratorState {
  final Uint8List uint8list;
  ImageGeneratorSuccessState({required this.uint8list});
}

class ImageGeneratorErrorState extends ImageGeneratorState {}
