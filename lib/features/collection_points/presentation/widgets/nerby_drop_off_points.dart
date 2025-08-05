import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_points_card.dart';
import 'package:flutter/material.dart';

class NerbyDropOffPoints extends StatelessWidget {
  const NerbyDropOffPoints({super.key});

  @override
  Widget build(BuildContext context) {
    final dropOffPoints = [
  {
    'title': 'Westlands Primary School',
    'address': '123 Main St, Cityville',
    'distance': '1.2 km',
    'rating': 4.5,
    'availabilityStatus': 'Available',
    'urgencyLevel': 'normal',
    'currentStock': 60,
    'maxCapacity': 100,
    'stockPercentage': 60.0,
    'iconType': 'school',
    'updatedTime': '5 min ago',
  },
  {
    'title': 'Karen Community Center',
    'address': '456 Elm St, Townsville',
    'distance': '2.5 km',
    'rating': 4.2,
    'availabilityStatus': 'Low',
    'urgencyLevel': 'urgent',
    'currentStock': 30,
    'maxCapacity': 100,
    'stockPercentage': 30.0,
    'iconType': 'community',
    'updatedTime': '10 min ago',
  },
  {
    'title': 'Kilimani Health Clinic',
    'address': '789 Oak St, Villagetown',
    'distance': '3.1 km',
    'rating': 4.8,
    'availabilityStatus': 'Urgent',
    'urgencyLevel': 'urgent',
    'currentStock': 10,
    'maxCapacity': 100,
    'stockPercentage': 10.0,
    'iconType': 'health',
    'updatedTime': '2 min ago',
  },
  {
    'title': 'Sarit Center Mall',
    'address': '321 Pine St, Hamlet',
    'distance': '4.0 km',
    'rating': 4.0,
    'availabilityStatus': 'Available',
    'urgencyLevel': 'normal',
    'currentStock': 80,
    'maxCapacity': 100,
    'stockPercentage': 80.0,
    'iconType': 'community',
    'updatedTime': '20 min ago',
  },
];

    return Column(
      children: [
        smallVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Locations',
              style: veryBoldSize18Text(AppColors.deepNavy),
            ),
            Text(
              'View All',
              style: veryBoldSize14Text(AppColors.floaidPurple),
            ),
          ],
        ),
        smallVerticalSizedBox,
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: dropOffPoints.length,
            itemBuilder: (context, index) {
              final point = dropOffPoints[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
               child: DropOffPointsCard(
  title: point['title'] as String,
  address: point['address'] as String,
  distance: point['distance'] as String,
  rating: point['rating'] as double,
  availabilityStatus: point['availabilityStatus'] as String,
  urgencyLevel: point['urgencyLevel'] as String,
  currentStock: point['currentStock'] as int,
  maxCapacity: point['maxCapacity'] as int,
  stockPercentage: point['stockPercentage'] as double,
  iconType: point['iconType'] as String,
  updatedTime: point['updatedTime'] as String,
  onSchedulePickup: () {},
  onCall: () {},
  onDirections: () {},
),
              );
            },
          ),
        ),
      ],
    );
  }
}