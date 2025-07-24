part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  final bool? isLoading;
  final AuthEntity? user;
  final String? errorMessage;


  const AuthState({
    this.isLoading,
    this.user,
    this.errorMessage,
  });
  
  AuthState copyWith({bool? isLoading, String? errorMessage, AuthEntity? user}){
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user
    );

  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, user];
}


