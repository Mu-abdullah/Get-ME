import 'package:flutter/material.dart';
import 'package:getme/core/entities/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الصفحة الرئيسية'),
    );
  }
}
