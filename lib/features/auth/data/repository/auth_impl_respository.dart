import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/exception.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/auth/data/datasource/remote_datasource.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, AuthEntity>> signInUserWithEmailAndPassword(AuthParams authParams) async{
    try {
      final results = await authRemoteDataSource.signInUserWithEmailAndPassword(authParams);
      return Right(results);
    }  on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }   
  }

  @override
  Future<Either<Failure, AuthEntity>> signInUserWithGoogle() async{
    try {
      final results = await authRemoteDataSource.signInUserWithGoogle();
      return Right(results);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser() async{
   try {
     final results = authRemoteDataSource.signOutUser();
      return Right(results);
   } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
   }
  

  @override
  Future<Either<Failure, AuthEntity>> signUpUserWithEmailAndPassword(AuthParams authParams) async{
    try {
      final results = await authRemoteDataSource.signUpUserWithEmailAndPassword(authParams);
      return Right(results);
    }  on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
  @override
  Future<Either<Failure, bool>> getCurrentUser() async {
    try {
      final results = await authRemoteDataSource.getCurrentUser();
      return Right(results);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}