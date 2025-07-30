// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class RecentActivityFeedCard extends StatelessWidget {
  final IconData leadingIcon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String timeStamp;

  const RecentActivityFeedCard({super.key,
   required this.leadingIcon, 
   required this.color, 
   required this.title, 
   required this.subtitle, 
   required this.onTap, 
   required this.timeStamp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.veryLightGray,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: ListTile(
        style: ListTileStyle.drawer,
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            leadingIcon,
            color: color,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: boldSize16Text(),
        ),
        subtitle: Text(
          subtitle,
          ),
        trailing: Text(
          timeStamp,
          style: normalSize14Text(AppColors.lightGrayishGreen),
        ),
        onTap: () {
          // Handle tap action
        },
      ),
    );
  }
}