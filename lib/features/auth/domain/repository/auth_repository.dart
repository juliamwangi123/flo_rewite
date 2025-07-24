// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> signUpUserWithEmailAndPassword(AuthParams);
  Future<Either<Failure, AuthEntity>> signInUserWithEmailAndPassword(AuthParams);
  Future<Either<Failure, AuthEntity>> signInUserWithGoogle();
  Future<Either<Failure, Void>> signOutUser();
}