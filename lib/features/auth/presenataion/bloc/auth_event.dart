part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpwithEmailandPsswordEvent extends AuthEvent {
  final AuthParams authParams;

  const SignUpwithEmailandPsswordEvent(this.authParams);

  @override
  List<Object> get props => [authParams];
} 

class SignInwithEmailandPasswordEvent extends AuthEvent {
  final AuthParams authParams;

  const SignInwithEmailandPasswordEvent(this.authParams);

  @override
  List<Object> get props => [authParams];
} 

class SignInwithGoogleEvent extends AuthEvent {
  const SignInwithGoogleEvent();

  @override
  List<Object> get props => [];
}
class SignOutUserEvent extends AuthEvent {
  const SignOutUserEvent();

  @override
  List<Object> get props => [];
}

class CheckCurrentUserEvent  extends AuthEvent {
  const CheckCurrentUserEvent();

  @override
  List<Object> get props => [];
}