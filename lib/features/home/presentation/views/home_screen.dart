import 'package:flutter/material.dart';
import 'package:getme/core/widgets/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText('الصفحة الرئيسية'),
      ),
    );
  }
}
