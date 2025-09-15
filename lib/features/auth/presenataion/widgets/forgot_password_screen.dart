import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  bool get getIsButtonActive {
    return emailController.text.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot  Password'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Text(
              'Enter your email address below to receive a password reset link.',
              style: mediumSize14Text(AppColors.deepNavy),
            ),
            smallVerticalSizedBox,
            CustomTextField(
              hintText: 'Enter your email',
              // labelText: 'Email',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              controller: emailController,
              
              onChanged: (_) {
                setState(() {});
              },
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
            CustomFloAidButton(
              isButtonActive: getIsButtonActive,
              handleSubmitButton: () {
                debugPrint('Reset link sent to ${emailController.text}');
              },
              buttonText: 'Send Reset Link',
              isGradient: true,
              buttonColor: AppColors.floaidPurple,
            ),
          ],
        ),
      ),
    );
  }
}
