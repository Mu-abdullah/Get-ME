import 'package:flutter/material.dart';

import '../widgets/home/cities/cities_body.dart';
import '../widgets/home_quote.dart';
import '../widgets/home/places/places.dart';

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
