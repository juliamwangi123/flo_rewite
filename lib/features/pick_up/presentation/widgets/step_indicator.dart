import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentPage;

  const StepIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       StepIndicatorItem(
          backgroundColor:  AppColors.floaidPurple,
          isActive: currentPage == 0 || currentPage == 1,
          pageNumber: 1,
        ),
        verySmallHorizontalSizedBox,
       Container(
          height: 2,
          width: 40,
          color: currentPage == 0  ? AppColors.lightGray: AppColors.floaidPurple,
        ),
        verySmallHorizontalSizedBox,
       StepIndicatorItem(
          backgroundColor: AppColors.floaidPurple,
          isActive: currentPage == 1,
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
        color: isActive ? backgroundColor : AppColors.paleGray,
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