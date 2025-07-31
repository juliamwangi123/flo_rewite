// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;
  const DrawerItem({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(leadingIcon, color: AppColors.deepNavy),
        title: Text(title, style: normalSize16Text(AppColors.deepNavy)),
        onTap: onTap,
        splashColor: AppColors.floaidPink.withOpacity(0.2), 
      ),
    );
  }
}
