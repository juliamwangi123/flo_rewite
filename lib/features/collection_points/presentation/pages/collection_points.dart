import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_location_search_field.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_points_map.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/nerby_drop_off_points.dart';
import 'package:flutter/material.dart';

class CollectionPoints extends StatelessWidget {
  const CollectionPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        smallVerticalSizedBox,
        DropOffLocationSearchInputField(handlefilter: () {}),
        mediumVerticalSizedBox,
        const  DropOffPointsMap(),
        mediumVerticalSizedBox,
        const Expanded(child: NearbyDropOffPoints()),
        smallVerticalSizedBox,
      ],
    );
  }
}