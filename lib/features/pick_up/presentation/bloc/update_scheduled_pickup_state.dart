part of 'update_scheduled_pickup_bloc.dart';

 class UpdateScheduledPickupState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final SchedulePickupEntity? scheduledPickup;

  const UpdateScheduledPickupState({
  this.isLoading = false,
   this.errorMessage,
   this.scheduledPickup,
  });
  
  UpdateScheduledPickupState copyWith({
   bool? isLoading,
   String? errorMessage,
   SchedulePickupEntity? scheduledPickup,

  }){
    return UpdateScheduledPickupState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      scheduledPickup: scheduledPickup ?? this.scheduledPickup
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, scheduledPickup];
}



