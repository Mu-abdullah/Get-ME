import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../style/statics/image_test.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          Lottie.asset(AppJson.noInternet),
        ],
      ),
    );
  }
}
