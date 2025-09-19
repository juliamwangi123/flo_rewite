import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/password_reset_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class SetNewPasswordUseCase implements UseCase<void, PasswordReserParams >{
  final AuthRepository authRepository;

  SetNewPasswordUseCase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(PasswordReserParams params) async{
   return authRepository.confirmPasswordReset(params);

  }

}
