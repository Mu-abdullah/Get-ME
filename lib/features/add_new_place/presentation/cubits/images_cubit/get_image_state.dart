part of 'get_image_cubit.dart';

abstract class GetImageState {}

class ImageUploadInitial extends GetImageState {}

class ImageUploadLoading extends GetImageState {}

class ImageUploadProgress extends GetImageState {
  final List<String> uploadedUrls;
  final int totalImages;
  ImageUploadProgress(this.uploadedUrls, this.totalImages);
}

class ImageUploadSuccess extends GetImageState {
  final List<File?> images;
  ImageUploadSuccess(this.images);
}

class ImageUploadFailure extends GetImageState {
  final String error;
  ImageUploadFailure(this.error);
}
