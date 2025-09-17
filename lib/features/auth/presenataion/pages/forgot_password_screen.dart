import 'dart:async';

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_snackbar.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}


class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool? isLoading = false;
  bool isCooldown = false; 
  Timer? _cooldownTimer;
  int remainingSeconds = 0;

  bool get getIsButtonActive {
    return emailController.text.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text) &&
        !isCooldown &&
        isLoading == false;
  }

   void startCooldown() {
    setState(() {
      isCooldown = true;
      remainingSeconds = 45; 
    });

    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        setState(() {
          isCooldown = false;
          timer.cancel();
        });
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading == true) {
              isLoading = true;
            } else {
              isLoading = false;
            }

            if (state.isPasswordReset == true) {
              showCustomSnackBar(
                context,
                'We’ve sent you a password reset link. Please check your email: ${emailController.text}',
                AppColors.successGreen,
                AppColors.offWhite,
              );

              startCooldown(); 
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'Enter your email address below to receive a password reset link.',
                  style: mediumSize14Text(AppColors.deepNavy),
                ),
                smallVerticalSizedBox,
                CustomTextField(
                  hintText: 'Enter your email',
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
                  isLoading: isLoading,
                  handleSubmitButton: () {
                    context.read<AuthBloc>().add(
                          PasswordResetEvent(email: emailController.text),
                        );
                  },
                  buttonText: isCooldown ? 'Resend' : 'Send Reset Link',
                  isGradient: true,
                  buttonColor: AppColors.floaidPurple,
                ),
                if (isCooldown) ...[
                  smallVerticalSizedBox,
                  Text(
                    'You can resend the link in $remainingSeconds seconds',
                    style: normalSize12Text(AppColors.deepNavy),
                  ),
                ],
                if (state.errorMessage != null) ...[
                  smallHorizontalSizedBox,
                  Text(state.errorMessage!),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}

