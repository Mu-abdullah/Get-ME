import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/font/fonts_helper.dart';
import '../../../../core/style/statics/strings_static.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../cubits/cubit/policy_cubit.dart';
import '../widgets/policy_listview.dart';

class PolicyBody extends StatelessWidget {
  const PolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = context.translate(LangKeys.appName);
    var isArabic = FontsHelper.isArabic(context);
    return BlocBuilder<PolicyCubit, PolicyState>(
      builder: (context, state) {
        if (state is PolicyLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, appName: appName, isArabic: isArabic),
                  PolicyListview(policyList: state.policy),
                  AppButton(
                    text: LangKeys.acceptPolicy,
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        } else if (state is PolicyError) {
          return Center(child: AppText(state.message));
        } else {
          return PolicyLoading();
        }
      },
    );
  }

  // بناء العنوان الرئيسي
  Widget _buildHeader(BuildContext context,
      {required String appName, required bool isArabic}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          '${isArabic ? StringsStatic.arPrivacyPolicy : StringsStatic.enPrivacyPolicy} "$appName"',
          isTitle: true,
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: customTextStyle(context),
            children: [
              TextSpan(
                text: isArabic
                    ? StringsStatic.arWelcome
                    : StringsStatic.enWelcome,
                style: customTextStyle(context, isBold: false, isTitle: false),
              ),
              TextSpan(
                text: ' "$appName" ',
                style: customTextStyle(context, color: AppColors.grey),
              ),
              TextSpan(
                text: isArabic
                    ? StringsStatic.arIntroduction
                    : StringsStatic.enIntroduction,
                style: customTextStyle(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PolicyLoading extends StatelessWidget {
  const PolicyLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return CustomShimmer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width *
                      0.5, // Replace with proper width calculation
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width *
                      0.75, // Replace with proper width calculation
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
