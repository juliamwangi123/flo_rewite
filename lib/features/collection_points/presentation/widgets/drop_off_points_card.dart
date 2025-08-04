// ignore_for_file: deprecated_member_use

import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class DropOffPointsCard extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String collectionDate;
  final String pinLocation;
  final VoidCallback? onSchedulePickup;
  final VoidCallback? onCall;
  final VoidCallback? onDirections;

  const DropOffPointsCard({
    super.key,
     required this.title,
    required this.address,
    required this.distance,
    required this.collectionDate,
    required this.pinLocation,
    this.onSchedulePickup,
    this.onCall,
    this.onDirections,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: AppColors.borderGray, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.aquaTeal.withOpacity(0.1),
            child: const Icon(
              Icons.school_outlined,
              color: AppColors.aquaTeal,
              size: 25,
            ),
          ),
          smallHorizontalSizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: boldSize18Text()),
                    Text(address, style: normalSize16Text(AppColors.lightGray)),
                  ],
                ),
               smallVerticalSizedBox,
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: AppColors.floaidPink,
                      size: 18,
                    ),
                    Text(
                      distance,
                      style: normalSize14Text(AppColors.lightGray),
                    ),
                  ],
                ),
                smallVerticalSizedBox,
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 18,
                      color: AppColors.lightGray,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Collection Date: $collectionDate',
                      style: normalSize12Text(AppColors.lightGray),
                    ),
                  ],
                ),
                smallVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onSchedulePickup,
                      icon: const Icon(Icons.schedule, size: 18),
                      label: const Text('Schedule Pickup'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.aquaTeal,
                        ),
                        foregroundColor: MaterialStateProperty.all(
                          AppColors.whiteColor,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        ),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    smallVerticalSizedBox,
                    Container(
                      height: 43,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: onCall,
                        icon: const Icon(Icons.call, color: AppColors.lightGray),
                        tooltip: 'Call',
                      ),
                    ),
                    smallVerticalSizedBox,
                    Container(
                      height: 43,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: onDirections,
                        icon: const Icon(
                          Icons.send,
                          color: AppColors.lightGray,
                        ),
                        tooltip: 'Directions',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
