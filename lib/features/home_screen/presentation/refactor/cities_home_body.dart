import 'package:flutter/material.dart';

import '../widgets/city_home/home_quote.dart';

class CitiesHomeBody extends StatelessWidget {
  const CitiesHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeQuote(),
      ],
    );
  }
}

