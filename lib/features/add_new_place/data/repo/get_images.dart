import 'dart:io';
import 'package:image_picker/image_picker.dart';

class GetImagesFromGallery {
  Future<List<File>> getImagesFromGallery({
    required ImagePicker picker,
  }) async {
    final List<XFile> pickedFiles = await picker.pickMultiImage();
    return pickedFiles.map((xFile) => File(xFile.path)).toList();
  }
}
