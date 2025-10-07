part of 'cancel_scheduled_pickup_bloc.dart';
class CancelScheduledPickupState extends Equatable {
  final bool? isLoading;
  final bool? isCancelledSucceffully;
  final String? errorMessage;

  const CancelScheduledPickupState({
    this.isLoading = false,
    this.isCancelledSucceffully = false,
    this.errorMessage = ''

  });

CancelScheduledPickupState copyWith({
 bool? isLoading,
 bool? isCancelledSucceffully,
 String? errorMessage

}){
  return CancelScheduledPickupState(
    isLoading: isLoading ?? this.isLoading,
    isCancelledSucceffully: isCancelledSucceffully ?? this.isCancelledSucceffully,
    errorMessage: errorMessage ?? this.errorMessage
  );

}

  
  @override
  List<Object?> get props => [isLoading, isCancelledSucceffully, errorMessage];
}

