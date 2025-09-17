import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/get_current_user_usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/usecase/password_reset_usecase.dart';
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
  final GetCurrentUserUseCase getCurrentUserUsecase;
  final PasswordResetUseCase passwordResetUseCase;

  AuthBloc(
    this.registerUseCase,
    this.signInUseCase,
    this.signInWithGoogleUsecase,
    this.signOutUserUsecase,
    this.getCurrentUserUsecase,
    this.passwordResetUseCase
    ) : super( const AuthState()) {
    on<SignUpwithEmailandPsswordEvent>(_onSignUpWithEmailAndPassword);
    on<SignInwithEmailandPasswordEvent>(_onSignInWithEmailAndPassword);
    on<SignInwithGoogleEvent>(_onSignInWithGoogle);
    on<SignOutUserEvent>(_onSignOutUser);
    on<CheckCurrentUserEvent>(_onGetCurrentUser);
    on<PasswordResetEvent> (_onPasswordReset);
  }

   void _onSignUpWithEmailAndPassword(SignUpwithEmailandPsswordEvent event, Emitter<AuthState> emit) async {
  emit(state.copyWith(isLoading: true, errorMessage: null));
  final failureOrRegisterUser = await registerUseCase(event.authParams);
  failureOrRegisterUser.fold(
    (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: (failure as ServerFailure).message)),
    (user) => emit(state.copyWith(isLoading: false, user: user, errorMessage: null, isUserLoggedIn: true)),
  );
}

void _onSignInWithEmailAndPassword(SignInwithEmailandPasswordEvent event, Emitter<AuthState> emit) async {
  emit(state.copyWith(isLoading: true, errorMessage: null));
  final failureOrRegisterUser = await signInUseCase(event.authParams); 
  failureOrRegisterUser.fold(
    (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: (failure as ServerFailure).message)),
    (user) => emit(state.copyWith(isLoading: false, user: user, errorMessage: null, isUserLoggedIn: true)),
  );
}

  void _onSignInWithGoogle(SignInwithGoogleEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isGoogleLoading: true, errorMessage: null));
    final failureOrRegisterUser = await signInWithGoogleUsecase(NoParams());
    failureOrRegisterUser.fold(
        (failure) => emit(state.copyWith(
            isGoogleLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isGoogleLoading: false, user: user, errorMessage: null, isUserLoggedIn: true)));

  }

    void _onSignOutUser(SignOutUserEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final failureOrSignOutUser = await signOutUserUsecase(NoParams());
    failureOrSignOutUser.fold(
        (failure) => emit(state.copyWith(
            isLoading: false,
            errorMessage: (failure as ServerFailure).message)),
        (user) => emit(state.copyWith(isLoading: false, user: null, errorMessage: null, isUserLoggedIn: false)));

  }

void _onGetCurrentUser(CheckCurrentUserEvent event , Emitter<AuthState> emit) async {
  emit(state.copyWith(isLoading: true, errorMessage: null));
  final  failureOrIsLoggedIn = await getCurrentUserUsecase(NoParams());
   failureOrIsLoggedIn.fold(
    (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: (failure as ServerFailure).message)),
    (isLoggedIn) => emit(state.copyWith(isLoading: false, isUserLoggedIn: isLoggedIn, errorMessage: null)),
  );  
}

void _onPasswordReset(PasswordResetEvent event, Emitter<AuthState> emit) async{
emit(state.copyWith(isLoading: true));
final  failureOrPasswordReset =  await passwordResetUseCase(event.email);
failureOrPasswordReset.fold(
   (failure) => emit(state.copyWith(
        isLoading: false,
        errorMessage: (failure as ServerFailure).message)),
    (passwordReset) => emit(state.copyWith(isLoading: false, isUserLoggedIn: false, errorMessage: null, isPasswordReset: true )),

  );


}
}

