import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_cordinates_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/stock_level_entity.dart';

class DropOffPointsModel extends DropOffPointsEntity {
  const DropOffPointsModel({
    required super.name,
    required super.address,
    required super.availabilityStatus,
    required super.urgencyLevel,
    required super.iconType,
    required super.updatedTime,
    required super.coordinates,
    required super.stockLevel,
    required super.isActive,
  });

 factory DropOffPointsModel.fromJson(Map<dynamic, dynamic> json) {
  final stockLevel = json['stock_level'] as Map<dynamic, dynamic>?;
  final coordinates = json['coordinates'] as Map<dynamic, dynamic>?; 
  // final operatingHours = json['operating_hours'] as Map<dynamic, dynamic>?;

  return DropOffPointsModel(
    name: json['name'] ?? '',
    address: json['address'] ?? '',
    availabilityStatus: json['availability_status'] ?? '',
    urgencyLevel: json['urgency_level'] ?? '',
    iconType: json['icon_type'] ?? '',
    updatedTime: json['updated_at'] ?? '', 
    isActive: json['is_active'] ?? false,
    coordinates: coordinates != null 
        ? DropOffCoordinatesEntity(
            latitude: (coordinates['latitude'] as num?)?.toDouble() ?? 0.0,
            longitude: (coordinates['longitude'] as num?)?.toDouble() ?? 0.0,
          )
        : const DropOffCoordinatesEntity(latitude: 0.0, longitude: 0.0),
    stockLevel: stockLevel != null 
        ? StockLevelEntity(
            current: stockLevel['current'] ?? 0, 
            capacity: stockLevel['capacity'] ?? 0,
            // Convert to double to handle both int and double values
            percentage: (stockLevel['percentage'] as num?)?.toDouble() ?? 0.0,
          )
        : const StockLevelEntity(current: 0, capacity: 0, percentage: 0.0),
    
  );
}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'availability_status': availabilityStatus,
      'urgency_level': urgencyLevel,
      'coordinates': {
        'latitude': coordinates.latitude,
        'longitude': coordinates.longitude,
      },
      'stock_level': {
        'current_stock': stockLevel.current,
        'max_capacity': stockLevel.capacity,
        'stock_percentage': stockLevel.percentage,
      },
      'is_active': isActive,

      'iconType': iconType,
      'updatedTime': updatedTime,
    };
  }
}
