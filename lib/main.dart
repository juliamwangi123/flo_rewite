import 'package:floo_aid_rewrite/core/routes/routes_genarator.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: AppTheme.getAppTheme(),
      home: const LoginScreen(),
      onGenerateRoute:generateRoutes ,
    );
  }
}



