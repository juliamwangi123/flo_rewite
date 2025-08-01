part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  final bool? isLoading;
  final AuthEntity? user;
  final String? errorMessage;
  final bool? isGoogleLoading;

  const AuthState({
    this.isLoading = false,
    this.user,
    this.errorMessage = '',
    this.isGoogleLoading = false,
  });
  
  AuthState copyWith({bool? isLoading, String? errorMessage, AuthEntity? user, bool? isGoogleLoading}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
    );

  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, user, isGoogleLoading];
}


