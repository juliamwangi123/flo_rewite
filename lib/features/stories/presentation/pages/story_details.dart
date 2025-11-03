import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/floaid_appbar.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/stories/domain/entity/story_entity.dart';
import 'package:flutter/material.dart';

class StoryDetailsPage extends StatelessWidget {
  final StoryEntity storyDetails;
  const StoryDetailsPage({super.key, required this.storyDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           FloAidAppBar(
              leadingWidget: Icons.arrow_back,
              onLeadingPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    smallVerticalSizedBox,  
                      Text(
                        storyDetails.title,
                        style: boldSize20Text(AppColors.deepNavy),
                      ),
                     smallVerticalSizedBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: Image.network(
                            storyDetails.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const ColoredBox(
                                color: AppColors.lightBackground,
                                child:  Icon(
                                  Icons.image_not_supported,
                                  size: 64,
                                  color: AppColors.blueGray
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      Text(
                        _formatDate(storyDetails.date),
                        style: normalSize14Text(AppColors.blueGray)
                      ),
                      mediumVerticalSizedBox,
                      Text(
                        storyDetails.plainTextContent ?? storyDetails.content, 
                        style: normalSize16Text(AppColors.deepBlue).copyWith(height: 1.6, letterSpacing: 0.3),
                      ),
                      veryLargeVerticalSizedBox
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}