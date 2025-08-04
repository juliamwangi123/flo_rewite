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
        'title': 'Community Center',
        'address': '123 Main St, Cityville',
        'distance': '1.2 km',
        'collectionDate': 'Aug 10, 2025',
        'pinLocation': 'loc1',
      },
      {
        'title': 'Library',
        'address': '456 Elm St, Townsville',
        'distance': '2.5 km',
        'collectionDate': 'Aug 12, 2025',
        'pinLocation': 'loc2',
      },
      {
        'title': 'Health Clinic',
        'address': '789 Oak St, Villagetown',
        'distance': '3.1 km',
        'collectionDate': 'Aug 15, 2025',
        'pinLocation': 'loc3',
      },
      {
        'title': 'School Hall',
        'address': '321 Pine St, Hamlet',
        'distance': '4.0 km',
        'collectionDate': 'Aug 18, 2025',
        'pinLocation': 'loc4',
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
                  title: point['title']!,
                  address: point['address']!,
                  distance: point['distance']!,
                  collectionDate: point['collectionDate']!,
                  pinLocation: point['pinLocation']!,
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