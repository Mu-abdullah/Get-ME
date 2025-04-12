import 'package:flutter/material.dart';

import '../widgets/buttons_listview.dart';
import '../widgets/user_info/user_card.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          UserInfoCard(),
          ButtonsListview(),
        ],
      ),
    );
  }
}
