import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/images_cubit/get_image_cubit.dart';
import '../place_info.dart';
import 'empty_state.dart';
import 'error_state.dart';
import 'image_grid_item.dart';
import 'loading_indecator.dart';

class ImageGridSection extends StatelessWidget {
  const ImageGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetImageCubit, GetImageState>(
      builder: (context, state) {
        var cubit = GetImageCubit.get(context);
        if (state is ImageUploadLoading) return const LoadingIndicator();
        if (state is ImageUploadSuccess) {
          return Column(
            children: [
              Expanded(child: ImageGrid(images: state.images)),
              cubit.images.isEmpty ? Container() : PlaceInfo(cubit: cubit)
            ],
          );
        }
        if (state is ImageUploadFailure) {
          return ErrorState(error: state.error);
        }
        return const EmptyState();
      },
    );
  }
}
