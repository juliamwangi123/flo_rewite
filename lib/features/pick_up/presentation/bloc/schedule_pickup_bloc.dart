import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/schedule_pickup_usecase.dart';

part 'schedule_pickup_event.dart';
part 'schedule_pickup_state.dart';

class SchedulePickupBloc
    extends Bloc<SchedulePickupEvent, SchedulePickupState> {
  final SchedulePickupUsecase schedulePickupUsecase;
  SchedulePickupBloc(this.schedulePickupUsecase)
    : super(const SchedulePickupState()) {
    on<SchedulePickupRequestEvent>(_onSchedulePickup);
  }

  void _onSchedulePickup(
    SchedulePickupRequestEvent event,
    Emitter<SchedulePickupState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        scheduledPickup: null,
      ),
    );
    final failureOrRequestPickUp = await schedulePickupUsecase(
      event.schedulePickupParams,
    );
    failureOrRequestPickUp.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message,
          scheduledPickup: null,
        ),
      ),
      (scheduledPickup) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          scheduledPickup: scheduledPickup,
        ),
      ),
    );
  }
}
