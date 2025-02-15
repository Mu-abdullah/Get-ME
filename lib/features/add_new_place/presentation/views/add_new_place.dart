import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/features/home_screen/data/model/city_model.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../cubits/images_cubit/image_upload_cubit.dart';
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
          create: (context) => ImageUploadCubit(city: city),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(translatedTitle: LangKeys.addNewPlace),
        body: const NewPlaceBody(),
      ),
    );
  }
}
