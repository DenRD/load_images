part of 'image_bloc.dart';

@immutable
abstract class ImageState {
  const ImageState();
}

class ImageInitial extends ImageState {
  const ImageInitial();
}

class ImageLoading extends ImageState{
  const ImageLoading();
}

class ImageLoaded extends ImageState{
  final List<PhotoData> photo;
  const ImageLoaded(this.photo);
}

class PhotoError extends ImageState{
  final String message;
  const PhotoError(this.message);
}
