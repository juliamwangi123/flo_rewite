import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_location_search_field.dart';
import 'package:flutter/material.dart';

class CollectionPoints extends StatelessWidget {
  const CollectionPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        DropOffLocationSearchInputField(handlefilter: () {}),
      ],
    );
  }
}