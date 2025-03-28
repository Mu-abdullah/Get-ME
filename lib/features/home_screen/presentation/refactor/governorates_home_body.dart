import 'package:flutter/material.dart';

import '../widgets/home/governorates/governorates_body.dart';
import '../widgets/home_quote.dart';
import '../widgets/home/places/places_body.dart';

class GovernoratesHomeBody extends StatelessWidget {
  const GovernoratesHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        HomeQuote(),
        Expanded(child: Governorates()),
        Expanded(child: PlacesBody()),
      ],
    );
  }
}
