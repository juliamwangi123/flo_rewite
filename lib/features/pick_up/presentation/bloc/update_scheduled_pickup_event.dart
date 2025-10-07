part of 'update_scheduled_pickup_bloc.dart';

abstract class UpdateScheduledPickupEvent extends Equatable {
  const UpdateScheduledPickupEvent();

  @override
  List<Object> get props => [];
}

class UpdateScheduledPickUpEvent extends UpdateScheduledPickupEvent{
  final UpdateScheduledPickupParams updateScheduledPickupParams;
  const UpdateScheduledPickUpEvent({required this.updateScheduledPickupParams});
   @override
  List<Object> get props => [updateScheduledPickupParams];

  
}