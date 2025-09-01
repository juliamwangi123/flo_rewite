import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String uuid;
  final String email;
  final bool isEmailVerified;
  final bool isNewUser;
  final String? displayName;
  final String? photoURL;
  final String? phoneNumber;

  const AuthEntity({
    required this.uuid,
    required this.email,
    required this.isEmailVerified,
    required this.isNewUser,
    this.displayName,
    this.photoURL,
    this.phoneNumber,
  });

  AuthEntity copyWith({
    String? uuid,
    String? email,
    bool? isEmailVerified,
    bool? isNewUser,
    String? displayName,
    String? photoURL,
    String? phoneNumber,
  }) {
    return AuthEntity(
      uuid: uuid ?? this.uuid,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isNewUser: isNewUser ?? this.isNewUser,
      displayName: displayName ?? this.displayName,
      photoURL: photoURL ?? this.photoURL,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [uuid, email, isEmailVerified, isNewUser, displayName, photoURL, phoneNumber];
}