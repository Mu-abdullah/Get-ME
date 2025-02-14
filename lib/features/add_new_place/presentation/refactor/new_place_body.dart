import 'package:flutter/material.dart';

import '../widgets/images_sections.dart';

class NewPlaceBody extends StatelessWidget {
  const NewPlaceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: ImageGridSection()),
        ],
      ),
    );
  }
}
