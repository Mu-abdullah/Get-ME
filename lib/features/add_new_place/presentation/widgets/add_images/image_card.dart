import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/style/color/color_light.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';

class ImageCard extends StatelessWidget {
  final File image;
  final int index;

  const ImageCard({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () =>
                BlocProvider.of<GetImageCubit>(context).removeImage(index),
            child: CircleAvatar(
              backgroundColor: ColorsLight.white.withValues(alpha: 0.9),
              radius: 15,
              child: Icon(HugeIcons.strokeRoundedImageDelete01,
                  size: 18, color: ColorsLight.red),
            ),
          ),
        ),
      ],
    );
  }
}
