part of 'schedule_pickup_bloc.dart';

abstract class SchedulePickupEvent extends Equatable {
  const SchedulePickupEvent();

  @override
  List<Object> get props => [];
}

class UpdateFormFieldEvent extends SchedulePickupEvent {
  final String field;
  final dynamic value;
  
  const UpdateFormFieldEvent({required this.field, required this.value});
  
  @override
  List<Object> get props => [field, value];
}

class SchedulePickupRequestEvent extends SchedulePickupEvent {
  final SchedulePickupParams schedulePickupParams;

  const SchedulePickupRequestEvent({required this.schedulePickupParams});

  @override
  List<Object> get props => [schedulePickupParams];
}

class ScheduleFormResetEvent extends SchedulePickupEvent {}

class ClearSuccessStateEvent extends SchedulePickupEvent {}
