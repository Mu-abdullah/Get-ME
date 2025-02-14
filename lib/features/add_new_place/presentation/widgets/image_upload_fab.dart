import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../cubits/cubit/image_upload_cubit.dart';

class ImageUploadFab extends StatelessWidget {
  const ImageUploadFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => BlocProvider.of<ImageUploadCubit>(context).getImages(),
      icon: Icon(HugeIcons.strokeRoundedCamera01, color: ColorsLight.white),
      label: AppText(context.translate(LangKeys.addPhotosToPalace),
          color: ColorsLight.white),
      backgroundColor: ColorsLight.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
