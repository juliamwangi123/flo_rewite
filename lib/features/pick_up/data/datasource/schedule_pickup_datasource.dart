import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/model/schedule_pickup_model.dart';
import 'package:http/http.dart' as http;

abstract class SchedulePickUpDataSource {
  Future<SchedulePickupModel> schedulePickup(SchedulePickupParams schedulePickupParams);  
}

class SchedulePickUpDataSourceImpl implements SchedulePickUpDataSource {
  final FirebaseDatabase firebaseDatabase;

  SchedulePickUpDataSourceImpl({required this.firebaseDatabase});

  @override
  Future<SchedulePickupModel> schedulePickup(SchedulePickupParams schedulePickupParams) async {
    final url = Uri.parse('https://floaid-fd7ad-default-rtdb.firebaseio.com/scheduled_pickups.json');

    try {
      final requestData = {
        'uId': schedulePickupParams.uId,
        'fullName': schedulePickupParams.fullName,
        'phoneNumber': schedulePickupParams.phoneNumber,
        'donationType': schedulePickupParams.donationType,
        'address': schedulePickupParams.address,
        'landmark': schedulePickupParams.landmark,
        'accessInstructions': schedulePickupParams.accessInstructions ?? '',
        'typeOfDonation': schedulePickupParams.typeOfDonation,
        'pickupDate': schedulePickupParams.pickupDate,
        'pickupTime': schedulePickupParams.pickupTime,
      };

      final response = await http.post(
        url,
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final generatedName = responseData['name'];
      

        final getResponse = await http.get(
          Uri.parse('https://floaid-fd7ad-default-rtdb.firebaseio.com/scheduled_pickups/$generatedName.json'),
        );

       

        if (getResponse.statusCode == 200) {
          final actualData = jsonDecode(getResponse.body);
          
          if (actualData == null) {
            return SchedulePickupModel.fromJson(requestData);
          }
          
          return SchedulePickupModel.fromJson(actualData);
        } else {
          return SchedulePickupModel.fromJson(requestData);
        }

      } else {
        throw Exception('Failed to schedule pickup. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to schedule pickup: $e');
    }
  }
}