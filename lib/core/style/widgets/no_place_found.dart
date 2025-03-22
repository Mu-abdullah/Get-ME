import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../features/home_screen/data/model/governorates_model.dart';
import '../../language/lang_keys.dart';
import '../../routes/routes_name.dart';
import '../statics/app_statics.dart';
import 'app_text.dart';

class NoPlaceFound extends StatelessWidget {
  const NoPlaceFound({
    super.key,
    this.city,
  });
  final GovernoratesModel? city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.mediumPadding,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(context.translate(LangKeys.noPlaces)),
          InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(RoutesNames.addPlaceScreen, arguments: {
              "city": city,
            }),
            borderRadius: AppBorderRadius.mediumRadius,
            child: Padding(
              padding: AppPadding.mediumPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  AppText(
                    "${context.translate(LangKeys.youAdd)} ${context.translate(LangKeys.place)}",
                    color: Colors.blue,
                  ),
                  Icon(
                    HugeIcons.strokeRoundedAddCircleHalfDot,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
