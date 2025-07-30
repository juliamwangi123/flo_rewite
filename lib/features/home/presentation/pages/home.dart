import 'package:floo_aid_rewrite/features/collection_points/presentation/pages/collection_points.dart';
import 'package:floo_aid_rewrite/features/community/presentation/pages/community.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/pages/dashboard.dart';
import 'package:floo_aid_rewrite/features/donations/presentation/pages/donation.dart';
import 'package:floo_aid_rewrite/features/home/presentation/widget/bottom_nav.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/pages/schedule_pick_up.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[0],
      bottomNavigationBar: const BottomNav(),
    );
  }
}

List<Widget> screens = [
  const DashboardScreen(),
  const CollectionPoints(),
  const SchedulePickUp(),
  const DonationScreen(),
  const CommunityPage()
  
];