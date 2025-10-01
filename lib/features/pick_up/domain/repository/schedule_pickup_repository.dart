import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';

abstract class SchedulePickupRepository {
  Future<Either<Failure, SchedulePickupEntity>> schedulePickup(SchedulePickupParams schedulePickupParams);
  Future<Either<Failure, List<SchedulePickupEntity>>>  getUserScheduledPickUps( String userId);
}