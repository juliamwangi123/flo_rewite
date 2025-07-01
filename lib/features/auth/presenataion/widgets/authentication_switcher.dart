import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthenticationSwitcher extends StatelessWidget {
  final String authToggleText;
  final String authActionText;
  final Function onAuthActionTap;


  const AuthenticationSwitcher({super.key, required this.authToggleText, required this.authActionText,  required this.onAuthActionTap});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$authToggleText? ',
        style: normalSize12Text(AppColors.blackColor),
        children:  <TextSpan>[

           TextSpan(
            text:authActionText,
            style: normalSize12Text(AppColors.floaidPink).copyWith(
              fontWeight: FontWeight.w600,),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onAuthActionTap();
                }
              )
        ]
      ) ,
    );
  }
}