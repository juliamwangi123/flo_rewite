import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_snackbar.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegestrationScreen extends StatelessWidget {
  const RegestrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user?.uuid.isNotEmpty ?? false) {
          Navigator.pushReplacementNamed(context, AppRoutes.emailVerification);
          showCustomSnackBar(
            context,
            'Account successfully created!',
            AppColors.successGreen,
            AppColors.offWhite,
          );
        }
         else if ( 
            state.errorMessage != null && 
            state.errorMessage!.isNotEmpty && 
            state.isLoading == false) {
          showCustomSnackBar(
            context,
            state.errorMessage!,
            AppColors.errorRed,
            AppColors.offWhite,
            duration: const Duration(seconds: 5),
          );
        } 
      },
      builder: (context, state) {
        return Center(
          child: AuthScreen(
            isLoading: state.isLoading,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            authHeaderTitle: 'Join FloAid',
            authHeaderSubtitle: 'Make a differnce in women\'s lives',
            isLoginScreen: false,
            handleSubmitButton: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty &&
                  confirmPasswordController.text.isNotEmpty) {
                context.read<AuthBloc>().add(
                  SignUpwithEmailandPsswordEvent(
                    AuthParams(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ),
                );
              }
            },
            onGoogleSignIn: () {
              context.read<AuthBloc>().add(const SignInwithGoogleEvent());
            },
          ),
        );
      },
    );
  }
}
