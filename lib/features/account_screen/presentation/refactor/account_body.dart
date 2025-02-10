import 'package:flutter/material.dart';

import '../widgets/buttons_listview.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonsListview(),
      ],
    );
  }
}
