part of 'cancel_scheduled_pickup_bloc.dart';

 class CancelScheduledPickupEvent extends Equatable {
  const CancelScheduledPickupEvent();

  @override
  List<Object> get props => [];
}

class HandleCancelScheduledPickupEvent extends CancelScheduledPickupEvent{
  final String id;
  const HandleCancelScheduledPickupEvent({required this.id});

  @override
  List<Object> get props => [id];

}