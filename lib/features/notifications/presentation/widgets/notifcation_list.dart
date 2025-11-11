import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:floo_aid_rewrite/features/notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class NotifcationList extends StatelessWidget {
  final List<NotificationModel> notifications;
  final VoidCallback onClearAll;

  const NotifcationList({
    super.key, 
    required this.notifications,
    required this.onClearAll,
  });

  String _getGroupKey(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final notificationDate = DateTime(date.year, date.month, date.day);

    if (notificationDate == today) {
      return 'Today';
    } else if (notificationDate == yesterday) {
      return 'Yesterday';
    } else {
      return 'Older';
    }
  }

  int _getGroupOrder(String groupKey) {
    switch (groupKey) {
      case 'Today':
        return 0;
      case 'Yesterday':
        return 1;
      case 'Older':
        return 2;
      default:
        return 3;
    }
  }

  void _showClearAllDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Clear All Notifications',
            style: boldSize18Text(AppColors.deepNavy),
          ),
          content: Text(
            'Are you sure you want to clear all notifications? This action cannot be undone.',
            style: normalSize14Text(AppColors.darkGray),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: boldSize14Text(AppColors.darkGray),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onClearAll();
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.floaidPink.withValues(alpha: .1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Clear All',
                  style: boldSize14Text(AppColors.floaidPink),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clear All Button
        if (notifications.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderColor.withValues(alpha: .3),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${notifications.length} notification${notifications.length == 1 ? '' : 's'}',
                  style: normalSize14Text(AppColors.darkGray),
                ),
                TextButton.icon(
                  onPressed: () => _showClearAllDialog(context),
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 18,
                  ),
                  label: Text(
                    'Clear All',
                    style: boldSize14Text(AppColors.floaidPink),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.floaidPink,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        // Grouped List
        Expanded(
          child: GroupedListView<NotificationModel, String>(
            elements: notifications,
            groupBy: (notification) => _getGroupKey(notification.receivedAt),
            groupSeparatorBuilder: (String groupValue) => Container(
              color: AppColors.borderColor.withValues(alpha: .2),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                groupValue.toUpperCase(),
                style: boldSize12Text(
                  AppColors.darkGray.withValues(alpha: .7),
                ).copyWith(letterSpacing: 0.5),
              ),
            ),
            itemBuilder: (context, NotificationModel notification) {
              return NotificationItem(
                notification: notification,
                color: notification.isRead
                    ? AppColors.borderColor
                    : AppColors.whiteColor,
              );
            },
            itemComparator: (item1, item2) =>
                item2.receivedAt.compareTo(item1.receivedAt),
            order: GroupedListOrder.ASC,
            groupComparator: (group1, group2) =>
                _getGroupOrder(group1).compareTo(_getGroupOrder(group2)),
            useStickyGroupSeparators: true,
            floatingHeader: true,
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}