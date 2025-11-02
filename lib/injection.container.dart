

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:floo_aid_rewrite/features/auth/data/datasource/remote_datasource.dart';
import 'package:floo_aid_rewrite/features/auth/data/repository/auth_impl_respository.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/get_current_user_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/password_reset_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/set_new_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_in_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_google_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/collection_points/data/datasource/remote_data_source_drop_off_points.dart';
import 'package:floo_aid_rewrite/features/collection_points/data/repository/drop_off_impl_repository.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/usecase/drop_off_point_usecase.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/bloc/drop_off_points_bloc.dart';
import 'package:floo_aid_rewrite/features/home/presentation/bloc/navigation_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/datasource/address_service.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/datasource/schedule_pickup_datasource.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/repository/schedule_pickup_impl_repository.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/repository/schedule_pickup_repository.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/cancel_scheduled_pickups_usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/get_user_scheduled_pickups.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/schedule_pickup_usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/update_scheduled_pickups_usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/address_recommendation_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/cancel_scheduled_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/get_users_scheduled_pickups_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/update_scheduled_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/stories/data/datasource/stories_remote_datasource.dart';
import 'package:floo_aid_rewrite/features/stories/data/repository/stories_impl_repository.dart';
import 'package:floo_aid_rewrite/features/stories/domain/repository/story_repository.dart';
import 'package:floo_aid_rewrite/features/stories/domain/usecase/story_usecase.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:floo_aid_rewrite/firebase_options.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
          
    );
  } catch (e) {
   
    rethrow;
  }
  
  // Register Firebase services AFTER Firebase is successfully initialized
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);
  sl.registerLazySingleton<GoogleSignIn>(GoogleSignIn.new);

  
  // Authentication Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        firebaseAuth: sl<FirebaseAuth>(),
        googleSignIn: sl<GoogleSignIn>(),
        firebaseDatabase: sl<FirebaseDatabase>()

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

sl.registerLazySingleton(
    () => GetCurrentUserUseCase(authRepository: sl<AuthRepository>()));

sl.registerLazySingleton(
    () => PasswordResetUseCase(authRepository: sl<AuthRepository>()));
sl.registerLazySingleton(
    () => SetNewPasswordUseCase(authRepository: sl<AuthRepository>()));

  // BLoCs
  sl.registerFactory(() => AuthBloc(
        sl<SignUpWithEmailPasswordUsecase>(),
        sl<SignInWithEmailAndPasswordUsecase>(),
        sl<SignUpWithGoogleUsecase>(),
        sl<SignOutUsecase>(),
        sl<GetCurrentUserUseCase>(),
        sl<PasswordResetUseCase>(),
        sl<SetNewPasswordUseCase>()

      ));

  sl.registerFactory(NavigationBloc.new);

  sl.registerLazySingleton<RemoteDataSourceDropOffPoints>(
    () => RemoteDataSourceDropOffPointsImpl(firebaseDatabase: sl<FirebaseDatabase>()),
  );

  // Repository
  sl.registerLazySingleton(
    () => DropOffImplRepository(remoteDataSourceDropOffPoints: sl<RemoteDataSourceDropOffPoints>()),
  );

  // Use Case
  sl.registerLazySingleton(
    () => DropOffPointUsecase(dropOffPointRepository: sl<DropOffImplRepository>()),
  );

  // BLoC
  sl.registerFactory(
    () => DropOffPointsBloc(sl<DropOffPointUsecase>()),
  );


// schedule pick up
sl.registerLazySingleton<SchedulePickUpDataSource>(
    () => SchedulePickUpDataSourceImpl(firebaseDatabase: sl<FirebaseDatabase>()),
  );
  sl.registerLazySingleton<SchedulePickupRepository>(
    () => SchedulePickupImplRepository(schedulePickUpDataSource: sl<SchedulePickUpDataSource>()),
  );
  
sl.registerLazySingleton(
    () => SchedulePickupUsecase(schedulePickupRepository: sl<SchedulePickupRepository>()),
  );

sl.registerLazySingleton(
    () => GetUserScheduledPickupsUseCase(schedulePickupRepository: sl<SchedulePickupRepository>()),
  );

  // BLoC
  sl.registerFactory(
    () => SchedulePickupBloc(sl<SchedulePickupUsecase>()),
  );       

  sl.registerLazySingleton<AddressService>(
    AddressServiceImpl.new,
  );

  sl.registerFactory(
    () => AdressRecommendationBloc(sl<AddressService>()),
  ); 

  sl.registerFactory(
    () => GetUsersScheduledPickupsBloc(sl<GetUserScheduledPickupsUseCase>()),
  );       

sl.registerLazySingleton(
    () => CancelScheduledPickupsUseCase(schedulePickupRepository: sl<SchedulePickupRepository>()),
  );

   sl.registerFactory(
    () => CancelScheduledPickupBloc( sl<CancelScheduledPickupsUseCase>()),
  );   

  sl.registerLazySingleton(
    () => UpdateScheduledPickupUsecase(schedulePickupRepository: sl<SchedulePickupRepository>()),
  );

   sl.registerFactory(
    () => UpdateScheduledPickupBloc( sl<UpdateScheduledPickupUsecase>()),
  );     


   //stoires
   // Data Source
sl.registerLazySingleton<StoriesRemoteDatasource>(
  StoriesRemoteDatasourceImpl.new,
);

// Repository
sl.registerLazySingleton<StoryRepository>(
  () => StoriesImplRepository(storiesRemoteDatasource: sl<StoriesRemoteDatasource>()),
);

// Use Case
sl.registerLazySingleton(
  () => StoryUseCase(storyRepository: sl<StoryRepository>()),
);

// BLoC
sl.registerFactory(
  () => StoriesBloc(sl<StoryUseCase>()),
);

}