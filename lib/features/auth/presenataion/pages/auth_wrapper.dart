import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:floo_aid_rewrite/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}


class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const CheckCurrentUserEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.isLoading == true ){
         const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
       if(state.isUserLoggedIn == true ){
        return const HomePage();
       }
       return const LoginScreen();
      },
    );
  }
}
