// ignore_for_file: deprecated_member_use
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class DropOffPointsCard extends StatelessWidget {
  final String title;
  final String address;
  final double distance;
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
            color: AppColors.blackColor.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                            style: normalSize16Text(AppColors.deepNavy),
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
                    verySmallVerticalSizedBox,
                    Text(
                      address,
                      style: normalSize14Text(AppColors.lightGray)
                    ),
                  ],
                ),
              ),
            ],
          ),
          
         smallVerticalSizedBox,
         
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
              smallHorizontalSizedBox,
             const Icon(
                Icons.location_on,
                size: 16,
                color: AppColors.floaidPink,
              ),
              verySmallHorizontalSizedBox,
              Text(
                 '${distance.toStringAsFixed(2)} km away',
                style: normalSize14Text(AppColors.lightGray),
              ),
              smallVerticalSizedBox,
            //  const Icon(
            //     Icons.star,
            //     size: 16,
            //     color: Colors.amber,
            //   ),
            //  veryLargeHorizontalSizedBox,
              // Text(
              //   rating.toString(),
              //   style: normalSize12Text(AppColors.lightGray)
              // ),
            ],
          ),   
          smallVerticalSizedBox,    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                'Stock Level',
                style:normalSize14Text(AppColors.lightGray), 
              ),
              Text(
                '$currentStock/$maxCapacity',
                style: boldSize14Text(AppColors.deepNavy),
              ),
            ],
          ),
          
         smallVerticalSizedBox,
          
          // Progress bar
          LinearProgressIndicator(
            value: stockPercentage / 100,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(
              _getStockLevelColor(stockPercentage),
            ),
            minHeight: 6,
          ),
          
          smallVerticalSizedBox,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onSchedulePickup,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.aquaTeal),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
           smallHorizontalSizedBox,
              DecoratedBox(
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
             smallHorizontalSizedBox,
              DecoratedBox(
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
          
          smallVerticalSizedBox,
          
          Text(
            'Updated $updatedTime',
            style: normalSize12Text(AppColors.lightGray),
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
        return AppColors.successGreen;
      case 'LOW':
        return AppColors.warningAmber;
      case 'URGENT':
        return AppColors.errorRed;
      case 'UNAVAILABLE':
      default:
        return AppColors.lightGray;
    }
  }

  Color _getStockLevelColor(double percentage) {
    if (percentage >= 70) return AppColors.successGreen;
    if (percentage >= 40) return AppColors.warningAmber;
    return Colors.red;
  }
}