part of 'get_users_scheduled_pickups_bloc.dart';

 class GetUsersScheduledPickupsEvent extends Equatable {
  const GetUsersScheduledPickupsEvent();

  @override
  List<Object> get props => [];
}

class FetchUserScheduledPickUpsEvent extends GetUsersScheduledPickupsEvent {
  final String userId;
  const FetchUserScheduledPickUpsEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}



