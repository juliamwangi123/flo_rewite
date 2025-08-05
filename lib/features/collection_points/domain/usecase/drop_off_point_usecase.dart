import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';

abstract class DropOffPointUseCase {
  Future<Either<Failure, List<DropOffPointsEntity>>> getNearbyDropOffPoints();
}