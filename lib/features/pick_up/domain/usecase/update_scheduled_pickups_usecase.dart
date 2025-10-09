import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/update_scheduled_pickups_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/repository/schedule_pickup_repository.dart';

class UpdateScheduledPickupUsecase implements UseCase<SchedulePickupEntity, UpdateScheduledPickupParams>{
final SchedulePickupRepository schedulePickupRepository;
UpdateScheduledPickupUsecase({required this.schedulePickupRepository});

  @override
  Future<Either<Failure, SchedulePickupEntity>> call(UpdateScheduledPickupParams params) async{
    return schedulePickupRepository.updateScheduledPickup(params);
   
  }
  
  
}