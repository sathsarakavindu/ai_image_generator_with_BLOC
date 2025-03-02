import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_generator_event.dart';
part 'image_generator_state.dart';

class ImageGeneratorBloc extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  ImageGeneratorBloc() : super(ImageGeneratorInitial()) {
    on<ImageGeneratorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
