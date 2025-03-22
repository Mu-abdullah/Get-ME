import 'package:flutter/material.dart';

import '../../../data/model/governorates_model.dart';
import 'governorates_gridview_item.dart';

class GovernoratesGridView extends StatelessWidget {
  const GovernoratesGridView({
    super.key,
    required this.governorates,
  });
  final List<GovernoratesModel> governorates;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: governorates.length,
      itemBuilder: (context, index) {
        final governorate = governorates[index];
        return GridViewGovernoratesItem(governorates: governorate);
      },
    );
  }
}
