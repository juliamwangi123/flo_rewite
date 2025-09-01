import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
    const AuthModel({
    required super.uuid,
    required super.email,
    required super.isEmailVerified,
    required super.isNewUser,
    super.displayName,
    super.photoURL,
    super.phoneNumber,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      uuid: json['uuid'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      isNewUser: json['isNewUser'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'isNewUser': isNewUser,
      'displayName': displayName,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
    };
  }
}
