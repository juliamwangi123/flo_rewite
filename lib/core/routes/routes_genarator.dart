import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/auth_wrapper.dart';
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
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  
   routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.baseRoute,
        name: 'base',
        builder: (context, state) => const AuthWrapper(),
      ),
      
      GoRoute(
        path: AppRoutes.loginRoute,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      GoRoute(
        path: AppRoutes.dashboardScreen,
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      
      GoRoute(
        path: AppRoutes.emailVerification,
        name: 'emailVerification',
        builder: (context, state) => const VerifyEmailScreen(),
      ),
      
      GoRoute(
        path: AppRoutes.homePage,
        name: 'home',
        builder: (context, state) {
          final pageIxndx = state.extra as int?;
          return  HomePage(pageIndx: pageIxndx);
        }
      ),
      
      GoRoute(
        path: AppRoutes.scheduleSuccessScreen,
        name: 'scheduleSuccess',
        builder: (context, state) => const SuccessScheduleBottomSheet(),
      ),
      
      GoRoute(
        path: AppRoutes.resetPasswordScreen,
        name: 'resetPassword',
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      
      GoRoute(
        path: '${AppRoutes.newPasswordScreen}:oobCode',
        name: 'newPassword',
        builder: (context, state) {
          final oobCode = state.pathParameters['oobCode']!;
          return SetNewPasswordScreen(oobCode: oobCode);
        },
      ),
      
      GoRoute(
        path: AppRoutes.schedulePickForm,
        name: 'schedulePickup',
        builder: (context, state) => const SchedulePickUpForm(),
      ),
      
      GoRoute(
        path: AppRoutes.storyDetails,
        name: 'storyDetails',
        builder: (context, state) {
          final story = state.extra as StoryEntity;
          return StoryDetailsPage(storyDetails: story);
        },
      ),
      
      GoRoute(
        path: AppRoutes.notificationsScreen,
        name: 'notifications',
        builder: (context, state) => const NotificationPage(),
      ),
    ],
    errorBuilder: (context, state) => const RegistrationScreen(),
  );
