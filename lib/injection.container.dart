

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floo_aid_rewrite/features/auth/data/datasource/remote_datasource.dart';
import 'package:floo_aid_rewrite/features/auth/data/repository/auth_impl_respository.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_in_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_google_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  try {
    await Firebase.initializeApp(
          
    );
  } catch (e) {
   
    rethrow;
  }
  
  // Register Firebase services AFTER Firebase is successfully initialized
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(GoogleSignIn.new);

  
  // Authentication Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        firebaseAuth: sl<FirebaseAuth>(),
        googleSignIn: sl<GoogleSignIn>(),
      ));

  // Authentication Repository
  sl.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(authRemoteDataSource: sl<AuthRemoteDataSource>()));

  // Authentication Use Cases
  sl.registerLazySingleton(() => SignUpWithEmailPasswordUsecase(
        authRepository: sl<AuthRepository>(),
      ));

  sl.registerLazySingleton(
      () => SignInWithEmailAndPasswordUsecase(authRepository: sl<AuthRepository>()));
  
  sl.registerLazySingleton(
      () => SignUpWithGoogleUsecase(authRepository: sl<AuthRepository>()));

 sl.registerLazySingleton(
      () => SignOutUsecase(authRepository: sl<AuthRepository>()));

  // BLoCs
  sl.registerFactory(() => AuthBloc(
        sl<SignUpWithEmailPasswordUsecase>(),
        sl<SignInWithEmailAndPasswordUsecase>(),
        sl<SignUpWithGoogleUsecase>(),
        sl<SignOutUsecase>(),
      ));
}