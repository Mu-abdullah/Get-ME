import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/app_text_form_felid.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/upload_images_cubit/upload_images_cubit.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo({
    super.key,
    required this.cubit,
  });

  final GetImageCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: AppText(
                  cubit.city?.country ?? "",
                  isTitle: true,
                )),
                Expanded(
                    child: AppText(
                  cubit.city?.nameAr ?? "",
                  isTitle: true,
                )),
              ],
            ),
          ),
          AppTextFormField(
            controller: cubit.placeName,
            type: TextInputType.text,
            hint: context.translate(LangKeys.placeName),
            validate: (value) {
              if (value!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
          ),
          AppTextFormField(
            controller: cubit.placeLocation,
            type: TextInputType.text,
            hint: context.translate(LangKeys.placelocation),
            validate: (value) {
              if (value!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
          ),
          AppTextFormField(
            controller: cubit.placeDescription,
            type: TextInputType.text,
            hint: context.translate(LangKeys.placeDescription),
            validate: (value) {
              if (value!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
          ),
          BlocBuilder<UploadImagesCubit, UploadImagesState>(
            builder: (context, state) {
              var uploadCubit = UploadImagesCubit.get(context);
              return AppButton(
                onTap: () {
                  if (cubit.images.isNotEmpty) {
                    uploadCubit.submitForm(images: cubit.images).then((c) {
                      debugPrint("done");
                      debugPrint("URLS: ${uploadCubit.urls.toString()}");
                    });
                  }
                },
                text: LangKeys.save,
              );
            },
          ),
        ],
      ),
    );
  }
}
