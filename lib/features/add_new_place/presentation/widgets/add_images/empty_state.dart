import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(HugeIcons.strokeRoundedImageAdd01,
              size: 80, color: AppColors.gray.withValues(alpha: 0.3)),
          const SizedBox(height: 20),
          AppText(context.translate(LangKeys.noPhotos), color: AppColors.gray),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () =>
                BlocProvider.of<GetImageCubit>(context).pickImages(),
            child: AppText(context.translate(LangKeys.addPhotosToPalace)),
          ),
        ],
      ),
    );
  }
}
