import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';

abstract class UseCase<T,Params> {
   Future<Either<Failure, T>> call(Params params);
}