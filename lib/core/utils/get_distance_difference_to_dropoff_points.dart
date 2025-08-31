import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_cordinates_entity.dart';
import 'package:geolocator/geolocator.dart';

double getDistanceDiffrenceToDropOffPoints(
 double deviceLat,
 double deviceLng,
 DropOffCoordinatesEntity dropOffPoints
){
final distance = Geolocator.distanceBetween(deviceLat, deviceLng,dropOffPoints.latitude, dropOffPoints.longitude);
return distance/1000;
}
