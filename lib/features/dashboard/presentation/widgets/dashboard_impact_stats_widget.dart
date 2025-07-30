import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/impact_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardStatWidget extends StatefulWidget {
  const DashboardStatWidget({super.key});

  @override
  State<DashboardStatWidget> createState() => _DashboardStatWidgetState();
}

class _DashboardStatWidgetState extends State<DashboardStatWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImpactStatsCardWidget(
            icon: Icons.favorite_border_outlined,
            color: AppColors.floaidPink,
            title: '142',
            subtitle: 'Girls\nHelped',
            onTap: () {
              // Handle water saved action
            },
          ),
          ImpactStatsCardWidget(
            icon: FontAwesomeIcons.cube,
            color: AppColors.mintGreen,
            title: '2.1K',
            subtitle: 'Pads\nDonated',
            onTap: () {
              // Handle trees planted action
            },
          ),
        ],
      ),
    );
  }
}