import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class SignOutUsecase  implements UseCase<void, void>{
  final AuthRepository authRepository;


  SignOutUsecase({required this.authRepository});
  @override
  Future<Either<Failure, dynamic>> call(params) async{
    return authRepository.signOutUser();
  
  }
}