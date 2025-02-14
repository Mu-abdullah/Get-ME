import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/language/lang_keys.dart';
import 'package:getme/core/style/widgets/custom_app_bar.dart';

import '../cubits/cubit/image_upload_cubit.dart';
import '../refactor/new_place_body.dart';
import '../widgets/image_upload_fab.dart';

class AddNewPlace extends StatelessWidget {
  const AddNewPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageUploadCubit(),
      child: Scaffold(
        appBar: CustomAppBar(translatedTitle: LangKeys.addNewPlace),
        body: const NewPlaceBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const ImageUploadFab(),
      ),
    );
  }
}
