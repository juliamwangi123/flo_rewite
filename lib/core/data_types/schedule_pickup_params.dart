class SchedulePickupParams{
  final String fullName;
  final String phoneNumber;
  final String donationType;
  final String address;
  final String landmark;
  final String? accessInstructions;
  final String typeOfDonation;
  final String pickupDate;
  final String pickupTime;

SchedulePickupParams({
    required this.fullName,
    required this.phoneNumber,
    required this.donationType,
    required this.address,
    required this.landmark,
    this.accessInstructions,
    required this.typeOfDonation,
    required this.pickupDate,
    required this.pickupTime,
  });
}