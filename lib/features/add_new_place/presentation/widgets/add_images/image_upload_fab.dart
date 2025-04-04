import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';

class ImageUploadFab extends StatelessWidget {
  const ImageUploadFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => BlocProvider.of<GetImageCubit>(context).pickImages(),
      icon: Icon(HugeIcons.strokeRoundedCamera01, color: AppColors.white),
      label: AppText(context.translate(LangKeys.addPhotosToPalace),
          color: AppColors.white),
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
