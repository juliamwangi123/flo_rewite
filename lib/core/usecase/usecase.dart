import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';

abstract class UseCase<Type,Params> {
   Future<Either<Failure, Type>> call(Params params);
}