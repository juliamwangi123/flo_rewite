import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/update_scheduled_pickups_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/update_scheduled_pickups_usecase.dart';

part 'update_scheduled_pickup_event.dart';
part 'update_scheduled_pickup_state.dart';

class UpdateScheduledPickupBloc extends Bloc<UpdateScheduledPickupEvent, UpdateScheduledPickupState> {
  final UpdateScheduledPickupUsecase updateScheduledPickupUsecase;

  UpdateScheduledPickupBloc(this.updateScheduledPickupUsecase) : super(const UpdateScheduledPickupState()) {
    on<UpdateScheduledPickUpEvent>(_handleUpdateScheduledPickUp);
    
  }

  void _handleUpdateScheduledPickUp (UpdateScheduledPickUpEvent event, Emitter<UpdateScheduledPickupState> emit) async{
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      scheduledPickup: null
    ));

    final finalOrUpdatePickup = await updateScheduledPickupUsecase(event.updateScheduledPickupParams);

     finalOrUpdatePickup.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message,
          scheduledPickup: null
        ),
      ),
      (updatedScheduledPickup) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          scheduledPickup: updatedScheduledPickup
        ),
      ),
    );
  }
}
