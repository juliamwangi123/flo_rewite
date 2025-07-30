// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/recent_activity_card.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/recent_activity_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';

final List<Map<String, dynamic>> activities = [
  {
    'title': 'Donation Collected',
    'subtitle': '2.1K pads donated',
    'activityTime': '2hr',
    'icon': FontAwesomeIcons.cube,
    'color': AppColors.mintGreen,
  },
  {
    'title': 'Pick Up Scheduled',
    'subtitle': 'Your pickup is set for 3 PM',
    'activityTime': '10hr',
    'icon': Icons.schedule,
    'color': AppColors.compassionateBlue,
  },
  {
   'title': 'Donation Delivered',
  'subtitle': 'Pads delivered to local school',
  'activityTime': '4hrs',
  'icon': Icons.local_shipping,
  'color': AppColors.successGreen,
  },
];

class RecentActivityFeed extends StatelessWidget {
  const RecentActivityFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGray, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGray.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const RecentActivityHeader(),
          mediumVerticalSizedBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return RecentActivityFeedCard(
                leadingIcon: activity['icon'],
                color: activity['color'],
                title: activity['title'],
                subtitle: activity['subtitle'],
                timeStamp: activity['activityTime'],
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}