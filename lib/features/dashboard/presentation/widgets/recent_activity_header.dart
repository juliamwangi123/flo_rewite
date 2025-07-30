import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class RecentActivityHeader extends StatelessWidget {
  const RecentActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Activity',
          style: veryBoldSize16Text(AppColors.deepNavy),
        ),
        Text(
          'View All',
          style: veryBoldSize14Text(AppColors.floaidPurple,),
        ),
      ],
    );
  }
}