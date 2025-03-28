import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/services/get_it/git_it.dart';
import 'package:getme/features/home_screen/data/model/governorates_model.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/add_images.dart';
import '../../data/repo/add_place_info.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/upload_images_cubit/upload_images_cubit.dart';
import '../refactor/new_place_body.dart';

class AddNewPlace extends StatelessWidget {
  const AddNewPlace({
    super.key,
    this.governorate,
  });
  final GovernoratesModel? governorate;

  @override
  Widget build(BuildContext context) {
    final lac = locator<AddPlaceInfo>();
    final imagesLac = locator<AddImages>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetImageCubit(governorate: governorate),
        ),
        BlocProvider(
          create: (context) =>
              UploadImagesCubit(addItemRepo: lac, addImagesRepo: imagesLac),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(translatedTitle: LangKeys.addNewPlace),
        body: const NewPlaceBody(),
      ),
    );
  }
}
