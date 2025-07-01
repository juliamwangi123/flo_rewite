import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/auth_form.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/authentication_switcher.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/forgot_password.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/submit_auth_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final String authHeaderTitle;
  final String authHeaderSubtitle;
  final bool isLoginScreen;
  final void Function() handleSubmitButton;


  const AuthScreen({
    super.key,
    required this.authHeaderTitle,
    required this.authHeaderSubtitle,
    required this.isLoginScreen,
    required this.handleSubmitButton,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.floaidPink, AppColors.floaidPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.floaidPink.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                widget.authHeaderTitle,
                style: boldSize30Text(
                  AppColors.deepBlue,
                ).copyWith(letterSpacing: -0.5, fontWeight: FontWeight.w800),
              ),
              smallVerticalSizedBox,
              Text(
                widget.authHeaderSubtitle,
                style: normalSize16Text(
                  AppColors.lightGray,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              largeVerticalSizedBox,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AuthForm(
                      isLoginScreen: widget.isLoginScreen,
                      formKey: _formKey,
                    ),
                  smallVerticalSizedBox,
                  widget.isLoginScreen ? 
                   ForgotPassword(
                    ): SizedBox.shrink(),
                    mediumVerticalSizedBox,
                    SubmitAuthButton(
                      isButtonActive:
                          _formKey.currentState?.validate() ?? false,
                      handleSubmitButton: widget.handleSubmitButton,
                    ),
                    smallVerticalSizedBox,
                    AuthenticationSwitcher(
                      authToggleText: widget.isLoginScreen ? 'Don\'t have an account' : 'Already have an account',
                      authActionText: widget.isLoginScreen ? 'Sign Up' : 'Login',
                      onAuthActionTap:() {
                        Navigator.pushReplacementNamed(
                          context,
                          widget.isLoginScreen ? '/register': '/login',
                        );
                      },

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
