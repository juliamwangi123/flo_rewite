import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/floaid_appbar.dart';
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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _notificationRepository = sl<NotificationRepository>();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    try {
      final result = await _notificationRepository.getNotifications();
      
      result.fold(
        (failure) {
          debugPrint('Failed to load notifications: $failure');
        },
        (list) {
          if (mounted) {
            setState(() {
              notifications = list..sort((a, b) => b.receivedAt.compareTo(a.receivedAt));
            });
          }
        },
      );

      await _notificationRepository.markAllAsRead();

    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _clearAllNotifications() async {
    try {
      await _notificationRepository.clearNotifications();
      if (mounted) {
        setState(() {
          notifications = [];
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('All notifications cleared'),
            backgroundColor: AppColors.floaidPurple,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error clearing notifications: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to clear notifications'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.floaidPink.withValues(alpha: .9),
                  AppColors.floaidPurple.withValues(alpha: .8),
                ],
              ),
            ),
            child: FloAidAppBar(
              titleWidget: Text(
                'Notifications',
                style: boldSize20Text(AppColors.whiteColor),
              ),
              leadingWidget: Icons.arrow_back,
              leadingIconColor: AppColors.whiteColor,
              onLeadingPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.floaidPurple,
                    ),
                  )
                : notifications.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_off_outlined,
                              size: 64,
                              color: AppColors.darkGray.withValues(alpha: .3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No notifications yet',
                              style: normalSize16Text(AppColors.darkGray),
                            ),
                          ],
                        ),
                      )
                    : NotifcationList(
                        notifications: notifications,
                        onClearAll: _clearAllNotifications,
                      ),
          ),
        ],
      ),
    );
  }
}