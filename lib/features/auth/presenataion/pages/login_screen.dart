import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_snackbar.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/widgets/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
   
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

   @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isUserLoggedIn == true ) {
          // Navigator.pushReplacementNamed(context, AppRoutes.homePage);
          showCustomSnackBar(
            context,
            'Successfully logged in!',
            AppColors.successGreen,
            AppColors.offWhite
          );
                    
          context.go(AppRoutes.homePage);

        }  
          else if ( 
            state.errorMessage != null && 
            state.errorMessage!.isNotEmpty && 
            state.isLoading == false && state.isLoginScreen == true) {
          showCustomSnackBar(
            context,
            state.errorMessage!,
            AppColors.errorRed,
            AppColors.offWhite,
            duration: const Duration(seconds: 2),
          ); 
        }    
      },
      builder: (context, state) {
        return Center(
          child: AuthScreen(
            isLoading:state.isLoading ,
            isGoogleLoading: state.isGoogleLoading,
            authHeaderTitle: 'Welcome Back',
            authHeaderSubtitle: 'Sign in to continue your journey',
            emailController: emailController,
            passwordController: passwordController,
            isLoginScreen: true,
            isErrorMessage: state.errorMessage ?? '',
            isAuthScreen: state.isLoginScreen,
            handleSubmitButton: () {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                context.read<AuthBloc>().add(
                  SignInwithEmailandPasswordEvent(
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
