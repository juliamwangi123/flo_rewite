import 'package:floo_aid_rewrite/core/routes/routes_genarator.dart';
import 'package:floo_aid_rewrite/core/services/deep_link_service.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/auth_wrapper.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:floo_aid_rewrite/features/home/presentation/bloc/navigation_bloc.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:floo_aid_rewrite/features/notifications/domain/repository/notification_repository.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/address_recommendation_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/cancel_scheduled_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/get_users_scheduled_pickups_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/update_scheduled_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:floo_aid_rewrite/injection.container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await di.init();
    await DeepLinkService.initialize();
     OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
     OneSignal.initialize('bec12332-c520-46c2-9df4-685e4cdb5ce7');
     OneSignal.Notifications.requestPermission(true);

     
    
     await Hive.initFlutter();
     final notificationRepo = di.sl<NotificationRepository>();
     Hive.registerAdapter(NotificationModelAdapter());
    await Hive.openBox<NotificationModel>('notificationsBox');
     OneSignal.Notifications.addForegroundWillDisplayListener((event){
      final notification = event.notification;
      notificationRepo.saveNotification(
        NotificationModel(
          id: notification.notificationId,
          title: notification.title ?? '',
          body: notification.body ?? '',
          receivedAt: DateTime.now(),
          isRead: false,
        ),
      );
      debugPrint('Notification clicked: ${notification.title} - ${notification.body}');

     });

    runApp(
      MultiBlocProvider(
        providers: [  
          BlocProvider(create: (_) => di.sl<AuthBloc>()),
          BlocProvider(create: (_) => di.sl<NavigationBloc>()),
          BlocProvider(create: (_) => di.sl<DropOffPointsBloc>()),
          BlocProvider(create: (_) => di.sl<SchedulePickupBloc>()),
          BlocProvider(create: (_) => di.sl<AdressRecommendationBloc>()),
          BlocProvider(create: (_) => di.sl<GetUsersScheduledPickupsBloc>()),
          BlocProvider(create: (_) => di.sl<CancelScheduledPickupBloc>()),
          BlocProvider(create: (_) => di.sl<UpdateScheduledPickupBloc>()),
          BlocProvider(create: (_) => di.sl<StoriesBloc>()),


        ],
        child: const MyApp(),
      ),
    );

  } catch (e) {
    throw Exception('Failed to initialize app: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloAid',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
       navigatorKey: DeepLinkService.navigatorKey, 
      home: const AuthWrapper(),
      onGenerateRoute: generateRoutes,
    );
  }
}