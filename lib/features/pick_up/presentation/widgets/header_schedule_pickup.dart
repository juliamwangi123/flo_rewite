import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class HeaderSchedulePickup extends StatelessWidget {
  const HeaderSchedulePickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.floaidPink.withValues(alpha: .9),
            AppColors.floaidPurple.withValues(alpha: .8),
          ],
        ),
        // borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Pickups', style: boldSize18Text(AppColors.whiteColor)),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Text(
                    'Schedule New',
                    style: normalSize12Text(AppColors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
          smallVerticalSizedBox,
          verySmallVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex:  2,
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  // margin:const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                  color: AppColors.whiteColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2',
                      style: boldSize22Text(AppColors.whiteColor),
                      ),
                      Text('Upcoming',
                      style: boldSize12Text(AppColors.whiteColor),
                      )
                    ],
                  ),
                
                ),
              ),
              smallHorizontalSizedBox,
              Expanded(
                // flex:  2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),         
                  decoration: BoxDecoration(
                  color: AppColors.whiteColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2',
                      style: boldSize22Text(AppColors.whiteColor),
                      ),
                      Text('Completed',
                      style: boldSize12Text(AppColors.whiteColor),
                      )
                    ],
                  ),
                
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
