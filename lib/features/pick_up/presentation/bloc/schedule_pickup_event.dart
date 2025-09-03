part of 'schedule_pickup_bloc.dart';

abstract class SchedulePickupEvent extends Equatable {
  const SchedulePickupEvent();

  @override
  List<Object> get props => [];
}

class SchedulePickupRequestEvent extends SchedulePickupEvent {
  final SchedulePickupParams schedulePickupParams;

  const SchedulePickupRequestEvent({required this.schedulePickupParams});

  @override
  List<Object> get props => [schedulePickupParams];
}
