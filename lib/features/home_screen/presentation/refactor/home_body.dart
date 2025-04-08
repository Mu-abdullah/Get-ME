import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/visited_places/visited_placed_cubit/visited_placed_cubit.dart';
import '../widgets/home/governorates/governorates_body.dart';
import '../widgets/home/places/places_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        BlocBuilder<VisitedPlacedCubit, VisitedPlacedState>(
          builder: (_, __) => Container(),
        ),
        Expanded(child: Governorates()),
        Expanded(child: PlacesBody()),
      ],
    );
  }
}
