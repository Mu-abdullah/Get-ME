import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/services/supabase/backend_points.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/model/new_place_model.dart';
import '../../../data/repo/add_images.dart';
import '../../../data/repo/add_place_info.dart';

part 'upload_images_state.dart';

class UploadImagesCubit extends Cubit<UploadImagesState> {
  final AddPlaceInfo addItemRepo;
  final AddImages addImagesRepo;
  UploadImagesCubit({required this.addImagesRepo, required this.addItemRepo})
      : super(UploadImagesInitial());

  static UploadImagesCubit get(context) => BlocProvider.of(context);
  final List<String> urls = [];
  String? itemId;

  Future<void> addItem({required NewPlaceModel placeModel}) async {
    emit(AddItemLoading());
    try {
      final result = await addItemRepo.addItem(date: placeModel.toJson());

      result.fold(
        (error) {
          debugPrint('Error adding item: ${error.message}');
          emit(AddItemFailed(error: error.message));
        },
        (serverResponse) {
          debugPrint('Server response: ${serverResponse.toJson()}');
          if (!isClosed) {
            itemId = serverResponse.placeId;
            debugPrint('Set itemId to: $itemId');
            emit(AddItemSuccess());
          }
        },
      );
    } catch (e) {
      debugPrint('Unexpected error in addItem: $e');
      emit(AddItemFailed(error: "Failed to add item: $e"));
    }
  }

  Future<void> submitForm({
    List<File?>? images,
    required String cityName,
    required String country,
  }) async {
    if (itemId == null) {
      emit(ImageUploadFailure('Item ID is missing. Add item first.'));
      return;
    }

    emit(ImageUploadLoading());
    try {
      final supabase = Supabase.instance.client;
      final storage = supabase.storage.from(BackendPoint.imageBucket);
      final List<String> uploadedUrls = [];
      final totalImages = images!.length;

      for (var i = 0; i < images.length; i++) {
        final image = images[i];
        if (image == null) continue;

        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';
        final categoryPath = '$country/$cityName/$itemId/$fileName';
        await storage.uploadBinary(categoryPath, await image.readAsBytes());
        final url = storage.getPublicUrl(categoryPath);
        uploadedUrls.add(url);
        emit(ImageUploadProgress(uploadedUrls, totalImages));
      }
      urls.addAll(uploadedUrls);

      for (final url in urls) {
        await addImagesRepo.addImages(
          date: {
            'place_id': itemId!,
            'url': url,
          },
        );
      }

      emit(ImageUploadRemoteSuccess(uploadedUrls));
    } catch (e) {
      emit(ImageUploadFailure('Submission failed: ${e.toString()}'));
    }
  }
}
