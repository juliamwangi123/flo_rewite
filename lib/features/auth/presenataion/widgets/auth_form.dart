import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isLoginScreen;
  final GlobalKey<FormState> formKey;

  const AuthForm({
    super.key, 
    required this.isLoginScreen, 
    required this.formKey
    });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Enter valid email',
            borderColor: AppColors.lightGray.withValues(alpha: 0.3),
            focusedBorderColor:AppColors.floaidPink,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.floaidPink,
              size: 20,
              
            ),
          ),
         mediumVerticalSizedBox,
          CustomTextField(
            hintText: 'Create a password',
            borderColor: AppColors.lightGray.withValues(alpha:0.3),
            focusedBorderColor:AppColors.floaidPink,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.floaidPink,
              size: 20,
            ),
            obscureText: obscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.floaidPink,
                size: 20,
              ),
            ),
          ),
          if(!widget.isLoginScreen)...[
            mediumVerticalSizedBox,
            CustomTextField(
            hintText: 'Confirm password',
            borderColor: AppColors.lightGray.withValues(alpha:0.3),
            focusedBorderColor:AppColors.floaidPink,
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.floaidPink,
              size: 20,
            ),
            obscureText: obscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.floaidPink,
                size: 20,
              ),
            ),
          )
          ]
          
        ],
      ),
    );
  }
}