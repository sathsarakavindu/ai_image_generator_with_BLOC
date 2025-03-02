part of 'image_generator_bloc.dart';

@immutable
sealed class ImageGeneratorState {}

final class ImageGeneratorInitial extends ImageGeneratorState {}

class InitialState extends ImageGeneratorState {}

class ImageGeneratorLoadingState extends ImageGeneratorState {}

class ImageGeneratorSuccessState extends ImageGeneratorState {}

class ImageGeneratorErrorState extends ImageGeneratorState {}
