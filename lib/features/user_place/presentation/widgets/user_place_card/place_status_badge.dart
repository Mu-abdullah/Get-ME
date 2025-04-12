import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/font/fonts_helper.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../home_screen/data/model/places_model.dart';

class PlaceStatusBadge extends StatelessWidget {
  const PlaceStatusBadge({super.key, required this.item});
  final PlacesModel item;
  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return Positioned(
      top: 0,
      right: !isArabic ? 15 : null,
      left: !isArabic ? null : 15,
      child: Container(
        decoration: BoxDecoration(
          color: _statusBGColor(item.status!),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText(
            isArabic
                ? context.translate(getPlaceStatus(item.status!))
                : item.status!,
            color: item.status == PlaceStatus.pending
                ? AppColors.black
                : AppColors.white,
          ),
        ),
      ),
    );
  }

  Color _statusBGColor(String status) {
    switch (status) {
      case PlaceStatus.pending:
        return AppColors.yellow;
      case PlaceStatus.approved:
        return AppColors.green;
      case PlaceStatus.rejected:
        return AppColors.red;
      default:
        return AppColors.yellow;
    }
  }

  String getPlaceStatus(String status) {
    switch (status) {
      case PlaceStatus.pending:
        return LangKeys.pending;
      case PlaceStatus.approved:
        return LangKeys.approved;
      case PlaceStatus.rejected:
        return LangKeys.rejected;
      default:
        return LangKeys.pending;
    }
  }
}
