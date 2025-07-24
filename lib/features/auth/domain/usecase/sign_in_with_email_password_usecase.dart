import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class SignInWithEmailAndPasswordUsecase implements UseCase<AuthEntity, AuthParams> {
  final AuthRepository authRepository;

  SignInWithEmailAndPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async {
    return authRepository.signInUserWithEmailAndPassword(params);
  }
}