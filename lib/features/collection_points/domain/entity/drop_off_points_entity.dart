import 'package:equatable/equatable.dart';

class DropOffPointsEntity extends Equatable {
  final String title;
  final String address;
  final String distance;
  final double rating;
  final String availabilityStatus;
  final String urgencyLevel;
  final int currentStock;
  final int maxCapacity;
  final double stockPercentage;
  final String iconType;
  final String updatedTime;

  const DropOffPointsEntity({
    required this.title,
    required this.address,
    required this.distance,
    required this.rating,
    required this.availabilityStatus,
    required this.urgencyLevel,
    required this.currentStock,
    required this.maxCapacity,
    required this.stockPercentage,
    required this.iconType,
    required this.updatedTime,
  });

  DropOffPointsEntity copyWith({
    String? title,
    String? address,
    String? distance,
    double? rating,
    String? availabilityStatus,
    String? urgencyLevel,
    int? currentStock,
    int? maxCapacity,
    double? stockPercentage,
    String? iconType,
    String? updatedTime,
  }) {
    return DropOffPointsEntity(
      title: title ?? this.title,
      address: address ?? this.address,
      distance: distance ?? this.distance,
      rating: rating ?? this.rating,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      urgencyLevel: urgencyLevel ?? this.urgencyLevel,
      currentStock: currentStock ?? this.currentStock,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      stockPercentage: stockPercentage ?? this.stockPercentage,
      iconType: iconType ?? this.iconType,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  @override
  List<Object?> get props => [
        title,
        address,
        distance,
        rating,
        availabilityStatus,
        urgencyLevel,
        currentStock,
        maxCapacity,
        stockPercentage,
        iconType,
        updatedTime,
      ];
}