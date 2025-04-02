import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../cubits/images_cubit/get_image_cubit.dart';

class ErrorState extends StatelessWidget {
  final String error;

  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(HugeIcons.strokeRoundedRssError, size: 40, color: AppColors.red),
          const SizedBox(height: 20),
          AppText(context.translate(LangKeys.error), color: AppColors.red),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                BlocProvider.of<GetImageCubit>(context).pickImages(),
            child: AppText(LangKeys.tryAgain),
          ),
        ],
      ),
    );
  }
}
