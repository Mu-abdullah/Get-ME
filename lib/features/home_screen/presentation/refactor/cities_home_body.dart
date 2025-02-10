import 'package:flutter/material.dart';

import '../widgets/city_home/cities.dart';
import '../widgets/city_home/home_quote.dart';
import '../widgets/city_home/places.dart';

class CitiesHomeBody extends StatelessWidget {
  const CitiesHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        HomeQuote(),
        Expanded(child: Cities()),
        Expanded(child: Places()),
      ],
    );
  }
}
