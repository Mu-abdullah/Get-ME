import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/data/model/city_model.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../cubits/images_cubit/get_image_cubit.dart';
import '../cubits/upload_images_cubit/upload_images_cubit.dart';
import '../refactor/new_place_body.dart';

class AddNewPlace extends StatelessWidget {
  const AddNewPlace({
    super.key,
    this.city,
  });
  final CityModel? city;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetImageCubit(city: city),
        ),
        BlocProvider(
          create: (context) => UploadImagesCubit(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(translatedTitle: LangKeys.addNewPlace),
        body: const NewPlaceBody(),
      ),
    );
  }
}
