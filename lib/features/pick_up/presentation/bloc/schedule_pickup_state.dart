part of 'schedule_pickup_bloc.dart';

class SchedulePickupState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final SchedulePickupEntity? scheduledPickup;

  const SchedulePickupState({this.isLoading = false, this.errorMessage = '', this.scheduledPickup });

  SchedulePickupState copyWith({
    bool? isLoading, 
    String? errorMessage, 
    SchedulePickupEntity? scheduledPickup}) 
    {
    return SchedulePickupState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      scheduledPickup: scheduledPickup ?? this.scheduledPickup,
    );
  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, scheduledPickup];
}

