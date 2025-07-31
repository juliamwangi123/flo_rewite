import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/dashboard_impact_stats_widget.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/dashboard_quick_action.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/recent_activity_feed.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 
  @override
  Widget build(BuildContext context) {
    return   
       Column(
         children: [
           
                 const WelcomeSection(),
                 mediumVerticalSizedBox,
                const DashboardQuickActionWidget(),
                mediumVerticalSizedBox,
                const  DashboardStatWidget(),
                 mediumVerticalSizedBox,
                 const RecentActivityFeed(),
                 mediumVerticalSizedBox,
               ],
             
           
         
       );
  }
}