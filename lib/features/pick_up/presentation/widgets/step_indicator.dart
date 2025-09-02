import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const StepIndicatorItem(
          backgroundColor: AppColors.floaidPurple,
          isActive: true,
          pageNumber: 1,
        ),
        verySmallHorizontalSizedBox,
       Container(
          height: 2,
          width: 40,
          color: AppColors.lightGray,
        ),
        verySmallHorizontalSizedBox,
       const StepIndicatorItem(
          backgroundColor: AppColors.floaidPurple,
          isActive: false,
          pageNumber: 2,
        )
      ],
    );
  }
}

class StepIndicatorItem extends StatelessWidget {
final Color backgroundColor;
final bool isActive;
final int pageNumber;

  const StepIndicatorItem({super.key, 
  required this.backgroundColor,
   required this.isActive, 
   required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: isActive ? backgroundColor : AppColors.lightGray,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          pageNumber.toString(),
          style: boldSize13Text(
            isActive ? AppColors.whiteColor : AppColors.deepNavy,
          ),
        ),
      ),
    );
  }
}