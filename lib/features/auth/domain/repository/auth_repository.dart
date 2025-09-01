// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> signUpUserWithEmailAndPassword(AuthParams authParams);
  Future<Either<Failure, AuthEntity>> signInUserWithEmailAndPassword(AuthParams authParams);
  Future<Either<Failure, AuthEntity>> signInUserWithGoogle();
  Future<Either<Failure, bool>> getCurrentUser();
  Future<Either<Failure, void>> signOutUser();
}