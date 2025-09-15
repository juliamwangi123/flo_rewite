
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/email_verification.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/regestration_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/forgot_password_screen.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/pages/dashboard.dart';
import 'package:floo_aid_rewrite/features/home/presentation/pages/home.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/confiramtion_schedule_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.baseRoute:
      return MaterialPageRoute<RegestrationScreen>(
          builder: (_) => const RegestrationScreen());
    case AppRoutes.loginRoute:
      return MaterialPageRoute<LoginScreen>(
          builder: (_) => const LoginScreen());
    case AppRoutes.dashboardScreen:
      return MaterialPageRoute<DashboardScreen>(
          builder: (_) => const DashboardScreen());
    case AppRoutes.emailVerification:
      return MaterialPageRoute<VerifyEmailScreen>(
          builder: (_) => const VerifyEmailScreen());
    case AppRoutes.homePage:
      return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage());
    case AppRoutes.scheduleSuccessScreen:
     return MaterialPageRoute<SuccessScheduleBottomSheet>(
          builder: (_) => const SuccessScheduleBottomSheet()); 
    case AppRoutes.resetPasswordScreen:
      return MaterialPageRoute<ResetPasswordScreen>(
        builder: (_) => const ResetPasswordScreen(),
      ); 
    default:
      return MaterialPageRoute<RegestrationScreen>(
        builder: (_) => const RegestrationScreen(),
      );
  }
}
