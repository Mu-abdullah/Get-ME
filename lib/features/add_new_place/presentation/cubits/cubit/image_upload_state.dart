part of 'image_upload_cubit.dart';

abstract class ImageUploadState {}

class ImageUploadInitial extends ImageUploadState {}

class ImageUploadLoading extends ImageUploadState {}

class ImageUploadProgress extends ImageUploadState {
  final List<String> uploadedUrls;
  final int totalImages;
  ImageUploadProgress(this.uploadedUrls, this.totalImages);
}

class ImageUploadSuccess extends ImageUploadState {
  final List<File?> images;
  ImageUploadSuccess(this.images);
}

class ImageUploadFailure extends ImageUploadState {
  final String error;
  ImageUploadFailure(this.error);
}
