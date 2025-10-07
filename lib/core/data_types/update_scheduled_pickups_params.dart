import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';

class UpdateScheduledPickupParams {
  final String id;
  final SchedulePickupParams pickupParams;
  
  UpdateScheduledPickupParams({required this.id, required this.pickupParams});
}