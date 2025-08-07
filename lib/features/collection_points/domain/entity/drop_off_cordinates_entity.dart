import 'package:equatable/equatable.dart';

class DropOffCordinatesEntity  extends Equatable{
  final double latitude;
  final double longitude;

  const DropOffCordinatesEntity({required this.latitude, required this.longitude});

  DropOffCordinatesEntity copyWith({double? latitude, double? longitude}) {
    return DropOffCordinatesEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude
    );
  }

  @override
  List<Object> get props => [latitude, longitude];

}