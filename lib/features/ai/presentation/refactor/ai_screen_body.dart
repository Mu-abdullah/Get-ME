import 'package:flutter/material.dart';

import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/style/widgets/custom_bottom_sheet.dart';
import 'ai_show_bottom_sheet.dart';

class AIScreenBody extends StatefulWidget {
  const AIScreenBody({super.key});

  @override
  State<AIScreenBody> createState() => _AIScreenBodyState();
}

class _AIScreenBodyState extends State<AIScreenBody> {
  @override
  void initState() {
    super.initState();
    getShowAgainValue();
  }

  // get shared value
  void getShowAgainValue() async {
    bool? showAgain = SharedPref.getData(key: PrefKeys.showAiIntroduction);
    if (showAgain == null || !showAgain) {
      _showBottomSheet();
    }
  }

  void _showBottomSheet() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      customShowBottomSheet(
        context: context,
        isScrollControlled: false,
        builder: (_) => const AIBottomSheet(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [],
    );
  }
}
