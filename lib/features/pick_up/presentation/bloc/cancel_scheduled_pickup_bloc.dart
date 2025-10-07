import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/cancel_scheduled_pickups_usecase.dart';

part 'cancel_scheduled_pickup_event.dart';
part 'cancel_scheduled_pickup_state.dart';

class CancelScheduledPickupBloc
    extends Bloc<CancelScheduledPickupEvent, CancelScheduledPickupState> {
  final CancelScheduledPickupsUseCase cancelScheduledPickups;
  CancelScheduledPickupBloc(this.cancelScheduledPickups)
    : super(const CancelScheduledPickupState()) {
    on<HandleCancelScheduledPickupEvent>(_handleCancelOfScheduledPickUp);
  }

  void _handleCancelOfScheduledPickUp(
    HandleCancelScheduledPickupEvent event,
    Emitter<CancelScheduledPickupState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        isCancelledSucceffully: false,
        errorMessage: null,
      ),
    );

    final failureOrCancelScheduledPickup = await cancelScheduledPickups(
      event.id,
    );
    failureOrCancelScheduledPickup.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message,
          isCancelledSucceffully: false,
        ),
      ),
      (suggestions) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: '',
          isCancelledSucceffully: true,
        ),
      ),
    );
  }
}
