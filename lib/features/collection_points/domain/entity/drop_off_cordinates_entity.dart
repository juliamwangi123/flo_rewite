import 'package:equatable/equatable.dart';

class DropOffCoordinatesEntity  extends Equatable{
  final double latitude;
  final double longitude;

  const DropOffCoordinatesEntity({required this.latitude, required this.longitude});

  DropOffCoordinatesEntity copyWith({double? latitude, double? longitude}) {
    return DropOffCoordinatesEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude
    );
  }

  @override
  List<Object> get props => [latitude, longitude];

}