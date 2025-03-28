import 'package:flutter/material.dart';

import '../../../../core/style/widgets/custom_shimmer.dart';

class AllCitiesLoading extends StatelessWidget {
  const AllCitiesLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
