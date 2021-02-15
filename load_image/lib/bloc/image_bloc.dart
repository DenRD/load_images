import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:load_image/data/model/dataModel.dart';
import 'package:load_image/data/services.dart';
import 'package:meta/meta.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final Services _services;

  ImageBloc(this._services) : super(ImageInitial());

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is GetPhotoData) {
      yield ImageLoading();
      try {
        List<PhotoData> data = await _services.getPhotoData();
        yield ImageLoaded(data);
      } catch (e) {
        yield PhotoError(e.toString());
      }
    }
  }
}
