import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final bool isLoginScreen;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final VoidCallback? onChanged;

  const AuthForm({
    super.key, 
    required this.isLoginScreen, 
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    this.onChanged,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Enter valid email',
            controller: widget.emailController,
            borderColor: AppColors.lightGray.withValues(alpha: 0.3),
            focusedBorderColor:AppColors.floaidPink,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.floaidPink,
              size: 20,    
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
         mediumVerticalSizedBox,
          CustomTextField(
            hintText: 'Create a password',
            controller: widget.passwordController,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
             
              return null;
            },  
          ),
          if(!widget.isLoginScreen)...[
            mediumVerticalSizedBox,
            CustomTextField(
            hintText: 'Confirm password',
            controller: widget.confirmPasswordController,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != widget.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          )
          ]
          
        ],
      ),
    );
  }
}