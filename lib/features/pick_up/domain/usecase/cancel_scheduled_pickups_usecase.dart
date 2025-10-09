import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/core/usecase/usecase.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/repository/schedule_pickup_repository.dart';

class CancelScheduledPickupsUseCase implements UseCase<void, String>{
  final SchedulePickupRepository schedulePickupRepository;
  CancelScheduledPickupsUseCase({required this.schedulePickupRepository});

  @override
  Future<Either<Failure, void>> call(String id) async{
    return schedulePickupRepository.cancelScheduledPickup(id);
   
  }

}