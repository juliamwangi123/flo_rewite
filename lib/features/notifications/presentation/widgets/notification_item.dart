import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final Color color;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: !notification.isRead 
                ? AppColors.borderColor.withValues(alpha: .3)
                : AppColors.whiteColor,
            border: Border(
              bottom: BorderSide(
                color: AppColors.borderColor.withValues(alpha: .5),
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(top: 6, right: 12),
                  decoration: BoxDecoration(
                    color: notification.isRead 
                        ? Colors.transparent 
                        : AppColors.floaidPink,
                    shape: BoxShape.circle,
                  ),
                ),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: boldSize14Text(
                                notification.isRead 
                                    ? AppColors.darkGray 
                                    : AppColors.blackColor
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                         verySmallHorizontalSizedBox,
                          Text(
                            timeago.format(notification.receivedAt),
                            style: normalSize12Text(
                              notification.isRead 
                                  ? AppColors.lightGray 
                                  : AppColors.darkGray
                            ),
                          ),
                        ],
                      ),
                      
                      verySmallVerticalSizedBox,
                      Text(
                        notification.body,
                        style: normalSize14Text(
                          notification.isRead 
                              ? AppColors.lightGray 
                              : AppColors.darkGray
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
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