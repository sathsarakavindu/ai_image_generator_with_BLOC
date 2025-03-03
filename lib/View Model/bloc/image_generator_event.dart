part of 'image_generator_bloc.dart';

@immutable
sealed class ImageGeneratorEvent {}

class InitialEvent extends ImageGeneratorEvent {}

class ImageGenerateButtonClickEvent extends ImageGeneratorEvent {
  final String txt;
  ImageGenerateButtonClickEvent({required this.txt});
}

class ImageDownloadButtonClickedEvent extends ImageGeneratorEvent {
  final Uint8List uint8list;
  ImageDownloadButtonClickedEvent({required this.uint8list});
}
