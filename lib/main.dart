import 'package:floo_aid_rewrite/core/routes/routes_genarator.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/pages/login_screen.dart';
import 'package:floo_aid_rewrite/features/dashboard/presentation/pages/dashboard.dart';
import 'package:floo_aid_rewrite/injection.container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();  
   try {
    // Initialize dependency injection (which initializes Firebase first)
    await di.init();
    
 
    

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthBloc>()),
        // BlocProvider(create: (_) => di.sl<NavigationBloc>()),
        // BlocProvider(create: (_) => di.sl<PickUpLocationBloc>()),
      ],
      child: const MyApp(),
    ));
  } catch (e) {
    throw Exception('Failed to initialize app: $e');

  }
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



