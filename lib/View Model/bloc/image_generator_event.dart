part of 'image_generator_bloc.dart';

@immutable
sealed class ImageGeneratorEvent {}

class InitialEvent extends ImageGeneratorEvent {}

class ImageGenerateButtonClickEvent extends ImageGeneratorEvent {}
