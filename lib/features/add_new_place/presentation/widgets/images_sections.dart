import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/image_upload_cubit.dart';
import 'empty_state.dart';
import 'error_state.dart';
import 'image_grid_item.dart';
import 'loading_indecator.dart';

class ImageGridSection extends StatelessWidget {
  const ImageGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadCubit, ImageUploadState>(
      builder: (context, state) {
        if (state is ImageUploadLoading) return const LoadingIndicator();
        if (state is ImageUploadSuccess) {
          return ImageGrid(images: state.images);
        }
        if (state is ImageUploadFailure) {
          return ErrorState(error: state.error);
        }
        return const EmptyState();
      },
    );
  }
}
