import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';

class DropOffPointsModel extends DropOffPointsEntity {
  const DropOffPointsModel({
    required super.title,
    required super.address,
    required super.distance,
    required super.rating,
    required super.availabilityStatus,
    required super.urgencyLevel,
    required super.currentStock,
    required super.maxCapacity,
    required super.stockPercentage,
    required super.iconType,
    required super.updatedTime,
  });

  factory DropOffPointsModel.fromJson(Map<String, dynamic> json) {
    return DropOffPointsModel(
      title: json['title'] as String,
      address: json['address'] as String,
      distance: json['distance'] as String,
      rating: (json['rating'] as num).toDouble(),
      availabilityStatus: json['availabilityStatus'] as String,
      urgencyLevel: json['urgencyLevel'] as String,
      currentStock: json['currentStock'] as int,
      maxCapacity: json['maxCapacity'] as int,
      stockPercentage: (json['stockPercentage'] as num).toDouble(),
      iconType: json['iconType'] as String,
      updatedTime: json['updatedTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'address': address,
      'distance': distance,
      'rating': rating,
      'availabilityStatus': availabilityStatus,
      'urgencyLevel': urgencyLevel,
      'currentStock': currentStock,
      'maxCapacity': maxCapacity,
      'stockPercentage': stockPercentage,
      'iconType': iconType,
      'updatedTime': updatedTime,
    };
  }
}