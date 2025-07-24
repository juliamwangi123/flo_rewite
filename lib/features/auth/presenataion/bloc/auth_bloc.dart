import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_in_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_email_password_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/sign_up_with_google_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpWithEmailPasswordUsecase registerUseCase;
  final SignInWithEmailAndPasswordUsecase signInUseCase;
  final SignUpWithGoogleUsecase signInWithGoogleUsecase;
  final SignOutUsecase signOutUserUsecase;

  AuthBloc(
    this.registerUseCase,
    this.signInUseCase,
    this.signInWithGoogleUsecase,
    this.signOutUserUsecase,
    ) : super( const AuthState()) {
    on<SignUpwithEmailandPsswordEvent>(_onSignUpWitjEmailAndPassword);
    on<SignInwithEmailandPasswordEvent>(_onSignUpWithEmaiandPassword);
    on<SignInwithGoogleEvent>(_onSignInWithGoogle);
    on<SignOutUserEvent>(_onSignOutUser);
  }

   void _onSignUpWitjEmailAndPassword(SignUpwithEmailandPsswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final failureOrRegisterUser = await registerUseCase(
        AuthParams(email: event.authParams.email, password: event.authParams.password));
    failureOrRegisterUser.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isLoading: false, user: user)));
  }

  void _onSignUpWithEmaiandPassword(SignInwithEmailandPasswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final failureOrRegisterUser = await registerUseCase(
        AuthParams(email: event.authParams.email, password: event.authParams.password));
    failureOrRegisterUser.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isLoading: false, user: user)));

  }

  void _onSignInWithGoogle(SignInwithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final failureOrRegisterUser = await signInWithGoogleUsecase(NoParams());
    failureOrRegisterUser.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isLoading: false, user: user)));

  }

    void _onSignOutUser(SignOutUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final failureOrRegisterUser = await signOutUserUsecase(NoParams());
    failureOrRegisterUser.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isLoading: false, user: user)));

  }

  
}
