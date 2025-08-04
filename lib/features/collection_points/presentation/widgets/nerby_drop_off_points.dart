import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/collection_points/presentation/widgets/drop_off_points_card.dart';
import 'package:flutter/material.dart';

class NerbyDropOffPoints extends StatelessWidget {
  const NerbyDropOffPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Neaby Locations',
          style: veryBoldSize16Text(AppColors.deepNavy),
        ),
        Text(
          'View All',
          style: veryBoldSize14Text(AppColors.floaidPurple,),
        ),
      ],
    ),
    smallVerticalSizedBox,
    DropOffPointsCard()

      ],
    );
  }
}