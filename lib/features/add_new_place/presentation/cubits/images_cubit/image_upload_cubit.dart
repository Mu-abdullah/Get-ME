import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/data/model/city_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repo/get_images.dart';
part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  GetImagesFromGallery getImagesFromGallery = GetImagesFromGallery();
  ImageUploadCubit({this.city}) : super(ImageUploadInitial());

  static ImageUploadCubit get(context) => BlocProvider.of(context);

  final CityModel? city;

  var formKey = GlobalKey<FormState>();
  var placeName = TextEditingController();
  var placeLocation = TextEditingController();
  var placeDescription = TextEditingController();

  List<File?> get images {
    if (state is ImageUploadSuccess) {
      return List.from((state as ImageUploadSuccess).images);
    }
    return [];
  }

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
        currentImages = currentImages.take(8).toList();
        emit(ImageUploadSuccess(currentImages));
      } else {
        emit(ImageUploadSuccess(newImages.take(8).toList()));
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

  // Optional: Add a method to pick an image from the camera
  Future<void> getImageFromCamera() async {
    emit(ImageUploadLoading());
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        File newImage = File(pickedFile.path);
        if (state is ImageUploadSuccess) {
          List<File?> currentImages =
              List.from((state as ImageUploadSuccess).images);
          if (currentImages.length < 8) {
            // Check limit before adding
            currentImages.add(newImage);
            emit(ImageUploadSuccess(currentImages));
          }
        } else {
          emit(ImageUploadSuccess([newImage]));
        }
      } else {
        emit(ImageUploadInitial()); // User canceled the picker
      }
    } catch (e) {
      emit(ImageUploadFailure(e.toString()));
    }
  }
}
