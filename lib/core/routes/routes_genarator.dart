import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/email_verification.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/registration_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/forgot_password_screen.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/set_new_password_screen.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/pages/dashboard.dart';
import 'package:floo_aid_rewrite/features/home/presentation/pages/home.dart';
import 'package:floo_aid_rewrite/features/notifications/presentation/pages/notification.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/pages/schedule_pick_up_form.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/confiramtion_schedule_screen.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/pages/story_details.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.baseRoute:
      return MaterialPageRoute<RegistrationScreen>(
        builder: (_) => const RegistrationScreen(),
      );
    case AppRoutes.loginRoute:
      return MaterialPageRoute<LoginScreen>(
        builder: (_) => const LoginScreen(),
      );
    case AppRoutes.dashboardScreen:
      return MaterialPageRoute<DashboardScreen>(
        builder: (_) => const DashboardScreen(),
      );
    case AppRoutes.emailVerification:
      return MaterialPageRoute<VerifyEmailScreen>(
        builder: (_) => const VerifyEmailScreen(),
      );
    case AppRoutes.homePage:
      return MaterialPageRoute<HomePage>(
        builder: (_) => const HomePage());
    case AppRoutes.scheduleSuccessScreen:
      return MaterialPageRoute<SuccessScheduleBottomSheet>(
        builder: (_) => const SuccessScheduleBottomSheet(),
      );
    case AppRoutes.resetPasswordScreen:
      return MaterialPageRoute<ResetPasswordScreen>(
        builder: (_) => const ResetPasswordScreen(),
      );
    case AppRoutes.newPasswordScreen:
      final String? oobCode = settings.arguments as String?;
      return MaterialPageRoute<SetNewPasswordScreen>(
        builder: (_) => SetNewPasswordScreen(oobCode: oobCode),
      );
    case AppRoutes.schedulePickForm:
      return MaterialPageRoute<SchedulePickUpForm>(
        builder: (_) => const SchedulePickUpForm(),
      );
      case AppRoutes.storyDetails:
      final StoryEntity story = settings.arguments as StoryEntity;
       return MaterialPageRoute<StoryDetailsPage>(
        builder: (_) => StoryDetailsPage(storyDetails: story,)
      );
      case AppRoutes.notificationsScreen:
      return MaterialPageRoute<NotificationPage>(
        builder: (_) => const NotificationPage(),
      );
    default:
      return MaterialPageRoute<RegistrationScreen>(
        builder: (_) => const RegistrationScreen(),
      );
  }
}
