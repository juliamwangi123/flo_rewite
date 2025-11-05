import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:floo_aid_rewrite/features/notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotifcationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotifcationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationItem(
          notification: notification,
          color: notification.isRead ? AppColors.borderColor : AppColors.whiteColor,
        );
      },
    );
  }
}