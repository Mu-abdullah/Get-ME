import 'package:flutter/material.dart';
import 'package:getme/core/entities/custom_app_bar.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/language/lang_keys.dart';
import 'package:getme/core/style/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBack: false,
        translatedTitle: LangKeys.homeScreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(context.translate(LangKeys.homeScreen)),
        ],
      ),
    );
  }
}
