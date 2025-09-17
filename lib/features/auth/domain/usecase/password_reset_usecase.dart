import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class PasswordResetUseCase implements UseCase<void, String >{
  final AuthRepository authRepository;

  PasswordResetUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(params) async{
   return authRepository.passwordReset(params) ;

  }

}