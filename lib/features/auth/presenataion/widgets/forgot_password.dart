import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot Password?',
        style: normalSize13Text(),
        textAlign: TextAlign.end,
      ),
    );
  }
}