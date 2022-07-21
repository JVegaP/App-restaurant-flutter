import 'package:app_restaurant_flutter/presentation/ui/history/history.dart';
import 'package:app_restaurant_flutter/presentation/ui/home/home.dart';
import 'package:app_restaurant_flutter/presentation/ui/login/login.dart';
import 'package:app_restaurant_flutter/presentation/ui/register/register.dart';
import 'package:app_restaurant_flutter/presentation/widgets/alert_custom.dart';
import 'package:flutter/material.dart';

final routes = Routes();
class Routes {
  ///go to Login Screen
  openLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const LoginPage()));
  }

  /// go to Register Screen
  openRegisterScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const RegisterPage()));
  }

  /// go to Home Screen
  openHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const HomePage()));
  }

  /// go to History Screen
  openHistoryScreen(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => const HistoryPage()));
  }

  /// got to Alert
  openAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertCustom(
          title: message
        )
    );
  }
}