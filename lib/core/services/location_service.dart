// ignore_for_file: deprecated_member_use

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
 static Future<bool> _ensureLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return  Geolocator.openLocationSettings();
      // return false;
    }
    return true;
  }

  // Check and request location permissions
 static Future<bool> _ensureLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Optionally open app settings so user can enable manually
      await Geolocator.openAppSettings();
      // return false;
    }
    
    return true;
  }

  // Get current device position with fallbacks
  static Future <Position?> getCurrentPosition() async {
    try {
      if (!await _ensureLocationService()) {
        throw Exception('Location services are disabled');
      }

      if (!await _ensureLocationPermission()) {
        throw Exception('Location permissions denied');
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

 static Future<Placemark?> getPlacemarkFromPosition(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      return placemarks.first;
    } catch (e) {
      return null;
    }
  }

  // Combined method to get position with placemark
static Future<Map<String, dynamic>?> getLocationWithPlacemark() async {
  if (!await _ensureLocationService()) {
    return null;
  }

  if (!await _ensureLocationPermission()) {
    return null;
  }

  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    
    Placemark? placemark = await getPlacemarkFromPosition(position);
    return {
      'position': position,
      'placemark': placemark,
    };
  } catch (e) {
    return null;
  }
}
}