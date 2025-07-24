import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String uuid;
  final String email;
  final bool isEmailVerified;
  final bool isNewUser;

  const AuthEntity({
    required this.uuid,
    required this.email,
    required this.isEmailVerified,
    required this.isNewUser,
  });

  AuthEntity copyWith({
    String? uuid,
    String? email,
    bool? isEmailVerified,
    bool? isNewUser,
  }) {
    return AuthEntity(
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isNewUser: isNewUser ?? this.isNewUser,
    );
  }

  @override
  List<Object?> get props => [uuid, email, isEmailVerified, isNewUser];
}