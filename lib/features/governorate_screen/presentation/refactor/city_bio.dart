import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/font/fonts_helper.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../cubits/city_bio_creator_cubit/city_bio_creator_cubit.dart';

class CityBio extends StatelessWidget {
  const CityBio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBioCreatorCubit, CityBioCreatorState>(
      builder: (context, state) {
        if (state is CityBioGenerated) {
          return _buildCityCreator(state, context);
        } else if (state is CityBioError) {
          return SliverToBoxAdapter(
            child: Center(child: AppText(state.error)),
          );
        }
        return _buildCityCreatorLoading();
      },
    );
  }

  SliverToBoxAdapter _buildCityCreator(
      CityBioGenerated state, BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () async =>
            await Clipboard.setData(ClipboardData(text: state.bio)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 2,
              ),
              children: _parseBoldText(state.bio),
            ),
          ),

          // AppText(
          //   state.bio.trim(),
          //   maxLines: 40,
          //   textAlign: TextAlign.justify,
          //   height: 2,
          //   fontSize: context.bodySmall!.fontSize,
          // ),
        ),
      ),
    );
  }

  List<TextSpan> _parseBoldText(String text) {
    final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*'); // البحث عن النص بين **
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in boldPattern.allMatches(text)) {
      // إضافة النص العادي قبل المطابقة
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: TextStyle(
            fontFamily: FontsHelper.fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: ColorsLight.black.withValues(alpha: 0.6),
          ),
        ));
      }
      // إضافة النص الغامق بدون **
      spans.add(
        TextSpan(
          text: match.group(1), // النص بدون **
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: FontsHelper.fontFamily,
          ),
        ),
      );
      lastMatchEnd = match.end;
    }

    // إضافة أي نص متبقٍ بعد آخر تطابق
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: TextStyle(
          fontFamily: FontsHelper.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          color: ColorsLight.black.withValues(alpha: 0.6),
        ),
      ));
    }

    return spans;
  }

  Widget _buildCityCreatorLoading() {
    return SliverToBoxAdapter(
      child: ShimmerLoadingText(),
    );
  }
}
