import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/color_light.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../cubits/cubit/image_upload_cubit.dart';

class ErrorState extends StatelessWidget {
  final String error;

  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(HugeIcons.strokeRoundedRssError,
              size: 40, color: ColorsLight.red),
          const SizedBox(height: 20),
          AppText(context.translate(LangKeys.error), color: ColorsLight.red),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () =>
                BlocProvider.of<ImageUploadCubit>(context).getImages(),
            child: AppText(LangKeys.tryAgain),
          ),
        ],
      ),
    );
  }
}