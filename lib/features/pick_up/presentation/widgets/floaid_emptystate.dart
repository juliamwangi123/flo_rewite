import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PickupsEmptyState extends StatelessWidget {
  const PickupsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.floaidPink.withValues(alpha: .2),
                    AppColors.floaidPurple.withValues(alpha: .1),
                  ],
                ),
              ),
              child: Icon(
                Icons.calendar_today_outlined,
                size: 20,
                color: Colors.pink.shade500,
              ),
            ),
            mediumVerticalSizedBox,
            Text(
              'No Pickups Scheduled Yet',
              style: boldSize20Text(AppColors.deepNavy),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            Text(
              'Start making a difference! Schedule your pickup and help provide menstrual products to those in need.',
              style: normalSize14Text(AppColors.blueGray),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // CTA Button
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.floaidPink,
                    AppColors.floaidPurple
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.floaidPink.withValues(alpha: .3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, AppRoutes.schedulePickForm);
                  context.push(AppRoutes.schedulePickForm);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Schedule Your Pickup',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

           
          ],
        ),
      ),
    );
  }
}

