import 'package:flutter/material.dart';
import 'package:getme/core/language/app_localizations.dart';

extension ContextExt on BuildContext {
  //Media Query methods
  double width({double percent = 1}) =>
      MediaQuery.of(this).size.width * percent;

  double height({double percent = 1}) =>
      MediaQuery.of(this).size.height * percent;

  // Navigation methods
  Future<dynamic> pushNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();

  // translations
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
}
