import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/auth_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: AuthScreen(
          authHeaderTitle: 'Welcome Back',
          authHeaderSubtitle: 'Sign in to continue your journey',
          isLoginScreen: true,
          handleSubmitButton: () {
            // Handle registration logic here
          },

        )
      );
    
  }
}