import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../data/repo/get_user_from_shared.dart';
import '../cubits/cubit/account_cubit.dart';
import '../refactor/account_body.dart';
import '../refactor/unregistered_body.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isUserLogin = false;
  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  Future<bool> checkUserLogin() async {
    var user = await SharedPref.getUserFromPreferences(key: PrefKeys.userModel);
    if (user != null) {
      setState(() {
        isUserLogin = true;
      });
    }
    return isUserLogin;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(GetUserFromShared()),
      child: isUserLogin ? AccountBody() : UnregisteredBody(),
    );
  }
}
