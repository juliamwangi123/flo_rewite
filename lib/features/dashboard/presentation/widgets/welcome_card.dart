// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
  String capitalizedUserName = '';

    const bool hasScheduledPickup = true;
    const String nextPickupDate = 'Tomorrow, 2:00 PM';
    String getGreeting() {
      final hour = DateTime.now().hour;
      if (hour < 12) return 'Good Morning';
      if (hour < 17) return 'Good Afternoon';
      return 'Good Evening';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.floaidPink.withOpacity(0.9),
            AppColors.floaidPurple.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.floaidPink.withOpacity(0.3),
        //     blurRadius: 20,
        //     offset: const Offset(0, 8),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              debugPrint('${state.user?.displayName}');
              final userName = state.user?.displayName?.split(' ').first ??   state.user?.email.split('@').first;
                 if(userName !=null){
                   capitalizedUserName =
                  userName.isNotEmpty
                      ? '${userName[0].toUpperCase()}${userName.substring(1)}'
                      : '';
                 }
              
              return Text(
                '${getGreeting()}, $capitalizedUserName. 💜',
                style: boldSize20Text(AppColors.whiteColor),
              );
            },
          ),
          verySmallVerticalSizedBox,
          Text(
            'Ready to make a difference today?',
            style: normalSize14Text(AppColors.whiteColor.withOpacity(0.9)),
          ),

          if (hasScheduledPickup) ...[
            mediumVerticalSizedBox,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.schedule_rounded,
                    color: AppColors.whiteColor,
                    size: 20,
                  ),
                  smallHorizontalSizedBox,
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        'Pickup scheduled for $nextPickupDate',
                        style: normalSize13Text(AppColors.whiteColor),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'View',
                        style: boldSize12Text(AppColors.whiteColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
