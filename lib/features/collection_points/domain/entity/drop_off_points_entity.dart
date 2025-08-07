import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_cordinates_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/stock_level_entity.dart';

class DropOffPointsEntity extends Equatable {
  final String name;
  final String address;
  final DropOffCordinatesEntity cordinates;
  final String availabilityStatus;
  final String urgencyLevel;
  final StockLevelEntity stockLevel;
  final String iconType;
  final String updatedTime;
  final bool isActive;
  // final OperatingHoursEntity? operatingHours;

  const DropOffPointsEntity({
    required this.name,
    required this.address,
    required this.availabilityStatus,
    required this.urgencyLevel,
    required this.iconType,
    required this.updatedTime,
    required this.cordinates,
    required this.stockLevel,
    required this.isActive,
    //  this.operatingHours,
  });

  DropOffPointsEntity copyWith({
    String? name,
    String? address,
    String? availabilityStatus,
    String? urgencyLevel,
    String? iconType,
    String? updatedTime,
    DropOffCordinatesEntity? cordinates,
    StockLevelEntity? stockLevel,
    bool? isActive,
    // OperatingHoursEntity? operatingHours,
  }) {
    return DropOffPointsEntity(
      name: name ?? this.name,
      address: address ?? this.address,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      urgencyLevel: urgencyLevel ?? this.urgencyLevel,
      iconType: iconType ?? this.iconType,
      updatedTime: updatedTime ?? this.updatedTime,
      cordinates: cordinates ?? this.cordinates,
      stockLevel: stockLevel ?? this.stockLevel,
      isActive: isActive ?? this.isActive,
      // operatingHours: operatingHours ?? this.operatingHours,

    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        availabilityStatus,
        urgencyLevel,
        iconType,
        updatedTime,
        cordinates,
        stockLevel,
        isActive,
        // operatingHours,
      ];
}