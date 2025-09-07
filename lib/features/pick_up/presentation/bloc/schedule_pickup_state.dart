part of 'schedule_pickup_bloc.dart';

class SchedulePickupState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final SchedulePickupEntity? scheduledPickup;
  final SchedulePickupEntity currentForm;

const SchedulePickupState({
    this.isLoading = false, 
    this.errorMessage = '', 
    this.scheduledPickup,
    this.currentForm = const SchedulePickupEntity(
      fullName: '',
      phoneNumber: '',
      address: '',
      landmark: '',
      accessInstructions: '',
      donationType: '',
      typeOfDonation: '',
      pickupDate: '',
      pickupTime: '',
    ),
  });

  SchedulePickupState copyWith({
    bool? isLoading, 
    String? errorMessage, 
    SchedulePickupEntity? scheduledPickup,
    SchedulePickupEntity? currentForm,
  }) {
    return SchedulePickupState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      scheduledPickup: scheduledPickup ?? this.scheduledPickup,
      currentForm: currentForm ?? this.currentForm,
    );
  }
  
  @override
  List<Object?> get props => [
    isLoading, 
    errorMessage, 
    scheduledPickup,
    currentForm,
  ];
}