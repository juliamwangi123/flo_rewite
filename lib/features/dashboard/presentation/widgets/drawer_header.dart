// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 30,),
      height: 170,
      decoration: BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.floaidPink.withOpacity(0.9),
            AppColors.floaidPurple.withOpacity(0.8),
          ],
        ),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              radius: 30,
              child: Text('J', style: veryBoldSize18Text(AppColors.floaidPink),),
            ),
            mediumHorizontalSizedBox,
            Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                smallVerticalSizedBox,
                Text('Julia', style: boldSize18Text(AppColors.whiteColor).copyWith(fontWeight: FontWeight.w700),),
                Text('Volunteer', style: normalSize14Text(AppColors.whiteColor.withOpacity(0.8))),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
                Navigator.of(context).pop(); 
              }, 
              icon: const Icon(Icons.close, color: AppColors.whiteColor)
              )
          ],
        ),
      ),
    );
  }
}