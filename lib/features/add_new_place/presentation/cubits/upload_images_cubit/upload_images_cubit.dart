import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/services/supabase/backend_points.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'upload_images_state.dart';

class UploadImagesCubit extends Cubit<UploadImagesState> {
  UploadImagesCubit() : super(UploadImagesInitial());
  static UploadImagesCubit get(context) => BlocProvider.of(context);

  final List<String> urls = [];

  Future<void> submitForm({
    List<File?>? images,
  }) async {
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
        await storage.uploadBinary(fileName, await image.readAsBytes());
        final url = storage.getPublicUrl(fileName);
        uploadedUrls.add(url);
        emit(ImageUploadProgress(uploadedUrls, totalImages));
      }
      urls.addAll(uploadedUrls);
      emit(ImageUploadRemoteSuccess(uploadedUrls));
    } catch (e) {
      emit(ImageUploadFailure('Submission failed: ${e.toString()}'));
    }
  }
}
