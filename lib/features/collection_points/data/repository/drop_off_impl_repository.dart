import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/collection_points/data/datasource/remote_data_source_drop_off_points.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/repository/drop_off_location_repository.dart';

class DropOffImplRepository  implements DropOffPointRepository{
  final RemoteDataSourceDropOffPoints remoteDataSourceDropOffPoints;

  DropOffImplRepository({required this.remoteDataSourceDropOffPoints});
  @override
  Future<Either<Failure, List<DropOffPointsEntity>>> getNearbyDropOffPoints() async{
   try {
      final points = await remoteDataSourceDropOffPoints.getNearbyDropOffPoints();
      return Right(points);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch drop-off points: ${e.toString()}'));
  }
  }
}