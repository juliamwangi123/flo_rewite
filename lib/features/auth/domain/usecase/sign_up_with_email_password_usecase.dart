import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/auth_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/entities/auth_entity.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class SignUpWithEmailPasswordUsecase implements UseCase<AuthEntity, AuthParams> {
  final AuthRepository authRepository;

  SignUpWithEmailPasswordUsecase({ required this.authRepository});

  @override
  Future<Either<Failure, AuthEntity>> call(AuthParams params) async{
    return authRepository.signUpUserWithEmailAndPassword(params);
    
  }


}
