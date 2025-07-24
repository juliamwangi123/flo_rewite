import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class SignUpWithGoogleUsecase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository authRepository;
  
  SignUpWithGoogleUsecase({required this.authRepository});
  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params)async{
    return authRepository.signInUserWithGoogle();
  }
} 