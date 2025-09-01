import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUseCase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  GetCurrentUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async{
    return  authRepository.getCurrentUser();
  }
}