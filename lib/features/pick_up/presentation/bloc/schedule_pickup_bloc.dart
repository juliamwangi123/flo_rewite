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
    on<UpdateFormFieldEvent>(_onUpdateFormField);
  }

  void _onUpdateFormField(
    UpdateFormFieldEvent event,
    Emitter<SchedulePickupState> emit,
  ) {
    final currentForm = state.currentForm;
    SchedulePickupEntity updatedForm;
    
    switch (event.field) {
      case 'fullName':
        updatedForm = currentForm.copyWith(fullName: event.value);
        break;
      case 'phoneNumber':
        updatedForm = currentForm.copyWith(phoneNumber: event.value);
        break;
      case 'address':
        updatedForm = currentForm.copyWith(address: event.value);
        break;
      case 'landmark':
        updatedForm = currentForm.copyWith(landmark: event.value);
        break;
      case 'accessInstructions':
        updatedForm = currentForm.copyWith(accessInstructions: event.value);
        break;
      case 'donationType':
        updatedForm = currentForm.copyWith(
          donationType: event.value,
          typeOfDonation: event.value, // Assuming these are the same
        );
        break;
      case 'pickupTime':
        updatedForm = currentForm.copyWith(pickupTime: event.value);
        break;
      case 'pickupDate':
        updatedForm = currentForm.copyWith(pickupDate: event.value);
        break;
      default:
        return; // Unknown field, don't emit
    }
    
    emit(state.copyWith(currentForm: updatedForm));
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