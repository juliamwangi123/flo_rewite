import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';

class SchedulePickupEntity extends Equatable{
  final String fullName;
  final String phoneNumber;
  final String donationType;
  final String address;
  final String landmark;
  final String? accessInstructions;
  final String typeOfDonation;
  final String pickupDate;
  final String pickupTime;
  final CountryCode? countryCode;

  const SchedulePickupEntity({
    required this.fullName,
    required this.phoneNumber,
    required this.donationType,
    required this.address,
    required this.landmark,
    this.accessInstructions,
    required this.typeOfDonation,
    required this.pickupDate,
    required this.pickupTime,
    this.countryCode,
  });

  SchedulePickupEntity copyWith({
    String? fullName,
    String? phoneNumber,
    String? donationType,
    String? address,
    String? landmark,
    String? accessInstructions,
    String? typeOfDonation,
    String? pickupDate,
    String? pickupTime,
    CountryCode? countryCode,
  }) {
    return SchedulePickupEntity(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      donationType: donationType ?? this.donationType,
      address: address ?? this.address,
      landmark: landmark ?? this.landmark,
      accessInstructions: accessInstructions ?? this.accessInstructions,
      typeOfDonation: typeOfDonation ?? this.typeOfDonation,
      pickupDate: pickupDate ?? this.pickupDate,
      pickupTime: pickupTime ?? this.pickupTime,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  List<Object?> get props => [
        fullName,
        phoneNumber,
        donationType,
        address,
        landmark,
        accessInstructions,
        typeOfDonation,
        pickupDate,
        pickupTime,
        countryCode,
      ];
}
 