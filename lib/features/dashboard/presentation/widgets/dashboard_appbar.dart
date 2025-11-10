import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/floaid_appbar.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardAppbar extends StatefulWidget {
  const DashboardAppbar({super.key});

  @override
  State<DashboardAppbar> createState() => _DashboardAppbarState();
}

class _DashboardAppbarState extends State<DashboardAppbar> {
   bool hasNotifications = true;
  @override
  Widget build(BuildContext context) {
    return FloAidAppBar(
                leadingWidget:Icons.menu,
                onLeadingPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                titleWidget: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.floaidPink, AppColors.floaidPurple],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.floaidPink.withValues(alpha: .3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.water_drop_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    verySmallHorizontalSizedBox,
                     Text(
                    'FloAid',
                    style: boldSize18Text(AppColors.deepNavy),),
                  ],
                ),
                trailingWidget: GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.notificationsScreen);
                  },
                  child: Stack(
                    children: [
                      Icon(
                            Icons.notifications_outlined,
                        size: 24,
                        color: 
                            AppColors.deepNavy.withValues(alpha: .7),
                      ),
                      if (hasNotifications)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.floaidPink,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
  }
}