// ignore_for_file: deprecated_member_use
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class DropOffPointsCard extends StatelessWidget {
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
  final VoidCallback? onSchedulePickup;
  final VoidCallback? onCall;
  final VoidCallback? onDirections;

  const DropOffPointsCard({
    super.key,
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
    this.onSchedulePickup,
    this.onCall,
    this.onDirections,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.borderGray, width: 1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon, title, and status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.aquaTeal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIconByType(iconType),
                  color: AppColors.aquaTeal,
                  size: 28,
                ),
              ),
              smallHorizontalSizedBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (urgencyLevel == 'urgent')
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'URGENT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Status and distance row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(availabilityStatus).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  availabilityStatus,
                  style: TextStyle(
                    color: _getStatusColor(availabilityStatus),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.location_on,
                size: 16,
                color: AppColors.floaidPink,
              ),
              const SizedBox(width: 4),
              Text(
                distance,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Stock level section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Stock Level',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$currentStock/$maxCapacity',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 8),
          
          // Progress bar
          LinearProgressIndicator(
            value: stockPercentage / 100,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getStockLevelColor(stockPercentage),
            ),
            minHeight: 6,
          ),
          
          const SizedBox(height: 16),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onSchedulePickup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.aquaTeal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Schedule Pickup',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: onCall,
                  icon: const Icon(Icons.phone, color: Colors.grey),
                  tooltip: 'Call',
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: onDirections,
                  icon: const Icon(Icons.directions, color: Colors.grey),
                  tooltip: 'Directions',
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Updated time
          Text(
            'Updated $updatedTime',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconByType(String type) {
    switch (type) {
      case 'school':
        return Icons.school_outlined;
      case 'community':
        return Icons.apartment_outlined;
      case 'health':
        return Icons.local_hospital_outlined;
      default:
        return Icons.location_on_outlined;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
        return Colors.green;
      case 'LOW':
        return Colors.orange;
      case 'URGENT':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getStockLevelColor(double percentage) {
    if (percentage >= 70) return Colors.green;
    if (percentage >= 40) return Colors.orange;
    return Colors.red;
  }
}