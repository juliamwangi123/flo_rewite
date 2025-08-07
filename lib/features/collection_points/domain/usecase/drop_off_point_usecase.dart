import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/repository/drop_off_location_repository.dart';

class DropOffPointUsecase  implements UseCase<List<DropOffPointsEntity>,NoParams >{
  final DropOffPointRepository dropOffPointRepository;

  DropOffPointUsecase({required this.dropOffPointRepository});

  @override
  Future<Either<Failure, List<DropOffPointsEntity>>> call(NoParams params) async{
    return  dropOffPointRepository.getNearbyDropOffPoints();
   
  }

}