import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:floo_aid_rewrite/features/notifications/domain/repository/notification_repository.dart';
import 'package:floo_aid_rewrite/features/notifications/presentation/widgets/notifcation_list.dart';
import 'package:floo_aid_rewrite/injection.container.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
    late final NotificationRepository _notificationRepository;
    List<NotificationModel> notifications = [];

    @override
  void initState() {
   super.initState();
   _notificationRepository = sl<NotificationRepository>();
   _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final result = await _notificationRepository.getNotifications();
    result.fold(
      (failure) {
        throw Exception('Failed to load notifications: $failure');
      },
      (list) {
        setState(() {
          notifications = list;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
      
        body: NotifcationList(notifications: notifications,));
  }
}