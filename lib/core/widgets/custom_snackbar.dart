import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context, 
  String contentString, 
  Color background,
  Color  contentTextColor,
  {Duration duration = const Duration(seconds: 2)}

  ){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(contentString, style: normalSize12Text(contentTextColor),),
      backgroundColor: background,
      duration: duration,
    ),
  );
}