part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  final bool? isLoading;
  final AuthEntity? user;
  final String? errorMessage;
  final bool? isGoogleLoading;
  final bool? isUserLoggedIn;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage = '',
    this.isGoogleLoading = false,
    this.isUserLoggedIn = false,
  });
  
  AuthState copyWith({bool? isLoading, String? errorMessage, AuthEntity? user, bool? isGoogleLoading, bool? isUserLoggedIn}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
    );

  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, user, isGoogleLoading, isUserLoggedIn];
}


