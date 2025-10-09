part of 'get_users_scheduled_pickups_bloc.dart';

class GetUsersScheduledPickupsState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<SchedulePickupEntity>? scheduledPickup;

  const GetUsersScheduledPickupsState({
    this.isLoading = false,
    this.errorMessage = '',
    this.scheduledPickup
  });

  GetUsersScheduledPickupsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<SchedulePickupEntity>? scheduledPickup,
  }) {
    return GetUsersScheduledPickupsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      scheduledPickup: scheduledPickup ?? this.scheduledPickup,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, scheduledPickup];
}
