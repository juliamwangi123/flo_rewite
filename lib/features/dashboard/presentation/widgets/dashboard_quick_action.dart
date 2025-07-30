import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/quick_action_card.dart';
import 'package:flutter/material.dart';

class DashboardQuickActionWidget extends StatefulWidget {
  const DashboardQuickActionWidget({super.key});

  @override
  State<DashboardQuickActionWidget> createState() => _DashboardQuickActionWidgetState();
}

class _DashboardQuickActionWidgetState extends State<DashboardQuickActionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickActionCardWidget(
            icon: Icons.location_pin,
            color: AppColors.aquaTeal,
            title: 'Find Drop-off',
            subtitle: '3 nearby',
            onTap: () {
              // Handle water intake action
            },
          ),
          QuickActionCardWidget(
            icon: Icons.calendar_month_outlined,
            color: AppColors.floaidPurple,
            title: 'Schedule Pick-up ',
            subtitle: 'Tomorrow',
            onTap: () {
              // Handle health tips action
            },
          ),  
        ],
      ),
    );
  }
}