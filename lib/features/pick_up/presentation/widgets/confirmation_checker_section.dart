import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class ConfirmationCheckerSection extends StatelessWidget {
  const ConfirmationCheckerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const  Icon(
            Icons.check_circle,
            color: AppColors.successGreen,
            size: 100,
          ),
      smallVerticalSizedBox,
      Text(
        'Pickup Scheduled Successfully!',
        style: normalSize24Text(AppColors.deepNavy).copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      tinyVerticalSizedBox,
      // Text(
      //   "Thank you for making a difference in someone's life. Your donation will help girls stay in school and maintain their dignity.",
      //   style: normalSize16Text(AppColors.blueGray),
      //   textAlign: TextAlign.center
      // ),

      ],

    );
  }
}