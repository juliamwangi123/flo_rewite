import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cancel_scheduled_pickup_event.dart';
part 'cancel_scheduled_pickup_state.dart';

class CancelScheduledPickupBloc extends Bloc<CancelScheduledPickupEvent, CancelScheduledPickupState> {
  CancelScheduledPickupBloc() : super(const CancelScheduledPickupState()) {
    on<CancelScheduledPickupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
