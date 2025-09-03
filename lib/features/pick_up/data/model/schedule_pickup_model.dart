import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';

class SchedulePickupModel extends SchedulePickupEntity{
  const SchedulePickupModel({
    required super.fullName,
    required super.phoneNumber,
    required super.donationType,
    required super.address,
    required super.landmark,
    super.accessInstructions,
    required super.typeOfDonation,
    required super.pickupDate,
    required super.pickupTime,
  });

  factory SchedulePickupModel.fromJson(Map<String, dynamic> json) {
    return SchedulePickupModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      donationType: json['donationType'],
      address: json['address'],
      landmark: json['landmark'],
      accessInstructions: json['accessInstructions'],
      typeOfDonation: json['typeOfDonation'],
      pickupDate: json['pickupDate'],
      pickupTime: json['pickupTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'donationType': donationType,
      'address': address,
      'landmark': landmark,
      'accessInstructions': accessInstructions,
      'typeOfDonation': typeOfDonation,
      'pickupDate': pickupDate,
      'pickupTime': pickupTime,
    };
  }
}
