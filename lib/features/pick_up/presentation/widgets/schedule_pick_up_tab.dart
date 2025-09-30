import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class SchedulePickUpTab extends StatelessWidget {
  const SchedulePickUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration:const BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
      bottom: BorderSide(
        width: 1.0,
        color: AppColors.offWhite,   
        style: BorderStyle.solid, 
      ),
    ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Upcoming (2)',
            style: boldSize13Text(AppColors.highlightPink)
          ),
          Text(
            'History (2)',
            style: boldSize13Text(AppColors.lightGray)
          ),
        ],
      ),
    );
  }
}