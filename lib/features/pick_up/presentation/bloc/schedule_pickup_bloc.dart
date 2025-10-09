import 'package:bloc/bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/schedule_pickup_usecase.dart';

part 'schedule_pickup_event.dart';
part 'schedule_pickup_state.dart';

class SchedulePickupBloc extends Bloc<SchedulePickupEvent, SchedulePickupState> {
  final SchedulePickupUsecase schedulePickupUsecase;

  SchedulePickupBloc(this.schedulePickupUsecase) : super(SchedulePickupState()) {
    on<SchedulePickupRequestEvent>(_onSchedulePickup);
    on<UpdateFormFieldEvent>(_onUpdateFormField);
    on<ScheduleFormResetEvent>(_onFormReset);
    on<ClearSuccessStateEvent>(_onClearSuccessState);
    on<InitializePickupFormEvent>(_onInitializePickupForm); 
  }

  void _onInitializePickupForm(
    InitializePickupFormEvent event,
    Emitter<SchedulePickupState> emit,
  ) {
    emit(
      state.copyWith(
        currentForm: event.entity,
      ),
    );
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
          typeOfDonation: event.value,
        );
        break;
      case 'pickupTime':
        updatedForm = currentForm.copyWith(pickupTime: event.value);
        break;
      case 'pickupDate':
        updatedForm = currentForm.copyWith(pickupDate: event.value);
        break;
      case 'countryCode':
        updatedForm = currentForm.copyWith(
          countryCode: CountryCode(
            code: (event.value as CountryCode).code ?? 'KE',
            dialCode: (event.value as CountryCode).dialCode ?? '+254',
            name: (event.value as CountryCode).name ?? 'Kenya',
          ),
        );
        break;
      default:
        return;
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

    final failureOrRequestPickUp =
        await schedulePickupUsecase(event.schedulePickupParams);

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

  void _onFormReset(
    ScheduleFormResetEvent event,
    Emitter<SchedulePickupState> emit,
  ) {
    emit(
      state.copyWith(
        currentForm: SchedulePickupEntity(
          fullName: '',
          phoneNumber: '',
          address: '',
          landmark: '',
          accessInstructions: '',
          donationType: '',
          typeOfDonation: '',
          pickupDate: '',
          pickupTime: '',
          countryCode: CountryCode(
            code: '',
            dialCode: '',
            name: '',
          ),
        ),
        isLoading: false,
        errorMessage: null,
        scheduledPickup: null,
      ),
    );
  }

  void _onClearSuccessState(
    ClearSuccessStateEvent event,
    Emitter<SchedulePickupState> emit,
  ) {
    emit(
      state.copyWith(
        scheduledPickup: null,
        errorMessage: null,
        isLoading: false,
      ),
    );
  }
}
