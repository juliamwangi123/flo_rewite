import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
final NotificationModel notification;
final Color color;

  const NotificationItem({super.key, 
    required this.notification,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){},
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: notification.isRead ? AppColors.borderColor: AppColors.whiteColor
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(top: 4, right: 12),
                  decoration: BoxDecoration(
                    color:  notification.isRead? AppColors.floaidPink : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: boldSize14Text(notification.isRead ? AppColors.lightGray : AppColors.blackColor),
                            ),
                          ),
                          verySmallVerticalSizedBox,
                          Text(
                            notification.receivedAt.toLocal().toString().split(' ')[0],
                            // style: TextStyle(
                            //   fontSize: 12,
                            //   color: isUnread ? Colors.grey[600] : Colors.grey[400],
                            // ),
                            style: normalSize12Text(notification.isRead ? AppColors.lightGray : AppColors.darkGray),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.body,
                        // style: TextStyle(
                        //   fontSize: 14,
                        //   color: isUnread ? Colors.grey[700] : Colors.grey[500],
                        // ),
                        style: normalSize14Text(notification.isRead ? AppColors.lightGray : AppColors.darkGray),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}