part of 'upload_images_cubit.dart';

abstract class UploadImagesState {}

final class UploadImagesInitial extends UploadImagesState {}

class ImageUploadLoading extends UploadImagesState {}

class ImageUploadProgress extends UploadImagesState {
  final List<String> uploadedUrls;
  final int totalImages;
  ImageUploadProgress(this.uploadedUrls, this.totalImages);
}

class ImageUploadSuccess extends UploadImagesState {
  final List<File?> images;
  ImageUploadSuccess(this.images);
}

class ImageUploadFailure extends UploadImagesState {
  final String error;
  ImageUploadFailure(this.error);
}

class ImageUploadRemoteSuccess extends UploadImagesState {
  final List<String> imageUrls;
  ImageUploadRemoteSuccess(this.imageUrls);
}

class AddItemLoading extends UploadImagesState {}

class AddItemSuccess extends UploadImagesState {}

class AddItemFailed extends UploadImagesState {
  final String error;
  AddItemFailed({required this.error});
}
