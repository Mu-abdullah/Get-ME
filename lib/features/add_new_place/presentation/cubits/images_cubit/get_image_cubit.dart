import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/data/model/governorates_model.dart';
import 'package:image_picker/image_picker.dart';

part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit({this.governorate}) : super(ImageUploadInitial());

  static GetImageCubit get(context) => BlocProvider.of(context);

  final GovernoratesModel? governorate;

  var formKey = GlobalKey<FormState>();
  var placeName = TextEditingController();
  var placeLocation = TextEditingController();
  var placeDescription = TextEditingController();

  List<File?> get images {
    if (state is ImageGetSuccess) {
      return List.from((state as ImageGetSuccess).images);
    }
    return [];
  }

  Future<void> pickImages() async {
    emit(ImageGetLoading());
    try {
      List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
      List<File?> newImages =
          pickedFiles.take(8).map((xFile) => File(xFile.path)).toList();
      if (state is ImageGetSuccess) {
        List<File?> currentImages =
            List.from((state as ImageGetSuccess).images);
        currentImages.addAll(newImages);
        currentImages = currentImages.take(8).toList();
        emit(ImageGetSuccess(currentImages));
      } else {
        emit(ImageGetSuccess(newImages.take(8).toList()));
      }
    } catch (e) {
      emit(ImageGetFailure(e.toString()));
    }
  }

  void removeImage(int index) {
    if (state is ImageGetSuccess) {
      final images = List<File?>.from((state as ImageGetSuccess).images);
      images.removeAt(index);
      emit(ImageGetSuccess(images));
    }
  }

  // Optional: Add a method to pick an image from the camera
  Future<void> getImageFromCamera() async {
    emit(ImageGetLoading());
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        File newImage = File(pickedFile.path);
        if (state is ImageGetSuccess) {
          List<File?> currentImages =
              List.from((state as ImageGetSuccess).images);
          if (currentImages.length < 8) {
            // Check limit before adding
            currentImages.add(newImage);
            emit(ImageGetSuccess(currentImages));
          }
        } else {
          emit(ImageGetSuccess([newImage]));
        }
      } else {
        emit(ImageUploadInitial()); // User canceled the picker
      }
    } catch (e) {
      emit(ImageGetFailure(e.toString()));
    }
  }
}
