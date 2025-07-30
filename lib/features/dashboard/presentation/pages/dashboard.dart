import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/widgets/dashboard_appbar.dart';
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
    return   Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
             const  DashboardAppbar(),
              mediumVerticalSizedBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WelcomeSection(),
                      mediumVerticalSizedBox,
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}