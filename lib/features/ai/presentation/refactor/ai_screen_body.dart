import 'package:flutter/material.dart';

import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../widgets/ai_show_bottom_sheet.dart';
import '../widgets/chat_screen.dart';

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

  void getShowAgainValue() async {
    var showAgain = await SharedPref.getData(key: PrefKeys.showAiIntroduction);
    debugPrint('showAgain: $showAgain');
    if (showAgain == null || showAgain == false) {
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
    return ChatScreen();
  }
}
