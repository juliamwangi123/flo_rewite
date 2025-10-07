import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/datasource/schedule_pickup_datasource.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/repository/schedule_pickup_repository.dart';

class SchedulePickupImplRepository  implements SchedulePickupRepository {
  final SchedulePickUpDataSource schedulePickUpDataSource;

  SchedulePickupImplRepository({required this.schedulePickUpDataSource});
  @override
  Future<Either<Failure, SchedulePickupEntity>> schedulePickup(SchedulePickupParams  schedulePickupParams) async{
    try{
      final result = await schedulePickUpDataSource.schedulePickup(schedulePickupParams );
      return Right(result);

    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
    
  }
  
  @override
  Future<Either<Failure, List<SchedulePickupEntity>>> getUserScheduledPickUps(String userId) async{
   try {
     final results = await schedulePickUpDataSource.getUserScheduledPickUps(userId);
     return Right(results);
   } catch (e) {
      return Left(ServerFailure(e.toString()));
   }
  }
  
  @override
  Future<Either<Failure, void>> cancelScheduledPickup(String id) async{
   try {
     final resulst = schedulePickUpDataSource.cancelScheduledPickup(id);
     return Right(resulst);
   } catch (e) {
     return Left(ServerFailure(e.toString()));
   }
   
  }

}