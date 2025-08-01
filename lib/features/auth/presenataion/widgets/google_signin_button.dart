import 'package:floo_aid_rewrite/core/constants/assets.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

Widget buildGoogleButton(final VoidCallback onPressed, final bool? isLoading) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGray, width: 1),
      ),
      child: isLoading == false ? Material(
        color: Colors.transparent,
        child: InkWell(
          onTap:onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(googleIcon, height: 24, width: 24),
             smallVerticalSizedBox,
               Text(
                'Continue with Google',
                 style: normalSize14Text(
                 AppColors.deepNavy
            )
              ),
            ],
          ),
        ),
      ): const Center(
        child: CircularProgressIndicator(
          color: AppColors.floaidPink,
        
        ),
      ),
    );
  }