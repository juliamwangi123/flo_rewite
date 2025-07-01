import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/auth_screen.dart';
import 'package:flutter/material.dart';

class RegestrationScreen extends StatelessWidget {
  const RegestrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: AuthScreen(
          authHeaderTitle: 'Join FloAid',
          authHeaderSubtitle: 'Make a differnce in women\'s lives',
          isLoginScreen: false,
          handleSubmitButton: () {
            // Handle registration logic here
          },

        )
      );
    
  }
}