import 'package:floo_aid_rewrite/core/data_types/password_reset_params.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_snackbar.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetNewPasswordScreen extends StatefulWidget {
  final String? oobCode;

  const SetNewPasswordScreen({super.key, this.oobCode});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscureText = true;

  bool? isLoading = false;

  bool get isButtonActive {
    return newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text == confirmPasswordController.text &&
        newPasswordController.text.length >= 6 &&
        isLoading == false;
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set New Password'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isLoading == true) {
              isLoading = true;
            } else {
              isLoading = false;
            }

            if (state.isNewPasswordSet == true) {
              showCustomSnackBar(
                context,
                'Your password has been updated. You can now log in with the new password.',
                AppColors.successGreen,
                AppColors.offWhite,
              );

              Navigator.of(context).popUntil((route) => route.isFirst);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter and confirm your new password.',
                  style: mediumSize14Text(AppColors.deepNavy),
                ),
                mediumVerticalSizedBox,
                CustomTextField(
                  hintText: 'New Password',
                  controller: newPasswordController,
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
                  onChanged: (_) => setState(() {}),
                ),
                mediumVerticalSizedBox,
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
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
                  onChanged: (_) => setState(() {}),
                ),
                mediumVerticalSizedBox,
                CustomFloAidButton(
                  isButtonActive: isButtonActive,
                  isLoading: isLoading,
                  buttonText: 'Update Password',
                  isGradient: true,
                  buttonColor: AppColors.floaidPurple,
                  handleSubmitButton: () {
                    context.read<AuthBloc>().add(
                      ConfirmPasswordResetEvent(
                        passwordReserParams: PasswordReserParams(
                          code: widget.oobCode!,
                          newPassword: newPasswordController.text,
                        ),
                      ),
                    );
                  },
                ),
                if (state.errorMessage != null && state.isErrorMessage == true ) ...[
                  smallVerticalSizedBox,
                  Text(
                    state.errorMessage!,
                    style: boldSize13Text(AppColors.errorRed),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
