import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repo/get_images.dart';
part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  GetImagesFromGallery getImagesFromGallery = GetImagesFromGallery();
  ImageUploadCubit() : super(ImageUploadInitial());

  static ImageUploadCubit get(context) => BlocProvider.of(context);
  Future<void> getImages() async {
    emit(ImageUploadLoading());
    try {
      List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
      List<File?> newImages =
          pickedFiles.take(8).map((xFile) => File(xFile.path)).toList();
      if (state is ImageUploadSuccess) {
        List<File?> currentImages =
            List.from((state as ImageUploadSuccess).images);
        currentImages.addAll(newImages);
        emit(ImageUploadSuccess(currentImages));
      } else {
        emit(ImageUploadSuccess(newImages));
      }
    } catch (e) {
      emit(ImageUploadFailure(e.toString()));
    }
  }

  void deleteImage(int index) {
    if (state is ImageUploadSuccess) {
      final images = List<File?>.from((state as ImageUploadSuccess).images);
      images.removeAt(index);
      emit(ImageUploadSuccess(images));
    }
  }
}
