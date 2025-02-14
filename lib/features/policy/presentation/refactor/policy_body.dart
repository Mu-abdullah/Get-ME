
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../cubits/cubit/policy_cubit.dart';
import '../widgets/policy_listview.dart';

class PolicyBody extends StatelessWidget {
  const PolicyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var appName = context.translate(LangKeys.appName);
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
                  _buildHeader(context, appName: appName),
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
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // بناء العنوان الرئيسي
  Widget _buildHeader(BuildContext context, {required String appName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'سياسة الخصوصية لتطبيق "$appName"',
          isTitle: true,
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: customTextStyle(context),
            children: [
              TextSpan(
                text: 'مرحبًا بكم في تطبيق ',
                style: customTextStyle(context, isBold: false, isTitle: false),
              ),
              TextSpan(
                text: '"$appName"',
                style: customTextStyle(context, color: ColorsLight.gray),
              ),
              TextSpan(
                text:
                    'نلتزم بحماية خصوصيتك وبياناتك الشخصية أثناء استخدامك لخدماتنا. تهدف هذه السياسة إلى توضيح كيفية جمع واستخدام وحماية المعلومات التي تقدمها أثناء استخدامك لتطبيقنا.',
                style: customTextStyle(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}