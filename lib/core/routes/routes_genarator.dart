
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/regestration_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.baseRoute:
      return MaterialPageRoute<RegestrationScreen>(
          builder: (_) => const RegestrationScreen());
    case AppRoutes.loginRoute:
      return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen());

    default:
      return MaterialPageRoute<RegestrationScreen>(
        builder: (_) => const RegestrationScreen(),
      );
  }
}
