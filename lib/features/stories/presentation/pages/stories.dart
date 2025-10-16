import 'package:floo_aid_rewrite/core/constants/assets.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/widgets/stories_card.dart';
import 'package:flutter/material.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       const StoriesCard(
          imageUrl: googleIcon,
          storyTitle: '5 Ways Community Collection Points Are Transforming Local Donations',
          postedAt: '3 days ago',
          readDuration: '3 mins',
        ),
        smallVerticalSizedBox,
       const StoriesCard(
          imageUrl: googleIcon,
          storyTitle: '5 Ways Community Collection Points Are Transforming Local Donations',
          postedAt: '3 days ago',
          readDuration: '3 mins',
        )
      ],
    );
    
  }
}