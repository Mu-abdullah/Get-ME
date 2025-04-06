import 'package:flutter/material.dart';

import '../../../../../auth/data/models/user_model.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderRadius.mediumRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Padding(
          padding: AppPadding.mediumPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText(user.name!, isTitle: true),
              AppText(user.phone!),
              AppText(user.mail!),
            ],
          ),
        ),
      ),
    );
  }
}
