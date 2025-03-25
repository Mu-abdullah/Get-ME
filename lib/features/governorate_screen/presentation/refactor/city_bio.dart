import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../../../../core/style/widgets/custom_snack_bar.dart';
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
        onLongPress: () async {
          if (state.bio.isEmpty) {
            return;
          } else {
            await Clipboard.setData(ClipboardData(text: state.bio));
            if (context.mounted) {
              CustomSnackbar().showTopSnackBar(
                context,
                message: context.translate(LangKeys.copied),
              );
            }
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 2,
              ),
              children: _parseBoldText(state.bio, context),
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

  List<TextSpan> _parseBoldText(String text, BuildContext context) {
    final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*'); // البحث عن النص بين **
    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in boldPattern.allMatches(text)) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: customTextStyle(
            context,
            fontSize: context.bodySmall!.fontSize,
            color: ColorsLight.black.withValues(alpha: 0.6),
            height: 2,
          ),
        ));
      }

      spans.add(
        TextSpan(
          text: match.group(1),
          style: customTextStyle(
            context,
            fontSize: context.titleMedium!.fontSize,
            isBold: true,
            height: 2.5,
          ),
        ),
      );
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: customTextStyle(
          context,
          fontSize: context.bodySmall!.fontSize,
          color: ColorsLight.black.withValues(alpha: 0.6),
          height: 2,
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
