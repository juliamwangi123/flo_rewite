part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  final bool? isLoading;
  final AuthEntity? user;
  final String? errorMessage;
  final bool? isGoogleLoading;
  final bool? isUserLoggedIn;
  final bool? isPasswordReset;
  final bool? isNewPasswordSet;
  final bool? isErrorMessage;
  final bool? isLoginScreen;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage ,
    this.isGoogleLoading = false,
    this.isUserLoggedIn = false,
    this.isPasswordReset = false,
    this.isNewPasswordSet = false,
    this.isErrorMessage  = false,
    this.isLoginScreen = false
  });
  
  AuthState copyWith({
    bool? isLoading, 
    String? errorMessage,
   AuthEntity? user, 
   bool? isGoogleLoading, 
   bool? isUserLoggedIn, 
   bool? isPasswordReset, 
   bool? isNewPasswordSet, 
   bool? isErrorMessage,
   bool? isLoginScreen
   }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      isPasswordReset: isPasswordReset ?? this.isPasswordReset,
      isNewPasswordSet: isNewPasswordSet ?? this.isNewPasswordSet,
      isErrorMessage: isErrorMessage ?? this.isErrorMessage,
      isLoginScreen: isLoginScreen ?? this.isLoginScreen

    );

  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, user, isGoogleLoading, isUserLoggedIn, isPasswordReset, isNewPasswordSet, isErrorMessage, isLoginScreen];
}


