import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/repository/schedule_pickup_repository.dart';

class SchedulePickupUsecase extends UseCase<SchedulePickupEntity, SchedulePickupParams> {
  final SchedulePickupRepository schedulePickupRepository;

  SchedulePickupUsecase({ required this.schedulePickupRepository});

  @override
  Future<Either<Failure, SchedulePickupEntity>> call(SchedulePickupParams params) async{
    return schedulePickupRepository.schedulePickup(params);

  }

}