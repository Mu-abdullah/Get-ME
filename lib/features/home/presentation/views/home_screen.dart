import 'package:flutter/material.dart';
import 'package:getme/core/entities/custom_app_bar.dart';
import 'package:getme/core/language/lang_keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        LangKeys.homeScreen,
        isBack: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
      ),
    );
  }
}
