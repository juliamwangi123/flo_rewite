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
      backgroundColor: AppColors.lightBackground,
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: AppColors.softWhite,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primaryPink,
                                AppColors.floaidPurple,
                                AppColors.primaryPink,
                              ],
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              storyDetails.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient:const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        AppColors.primaryPink,
                                        AppColors.floaidPurple,
                                        AppColors.primaryPink,
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.article_outlined,
                                      size: 64,
                                      color: AppColors.softWhite,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      mediumVerticalSizedBox,
                      Card(
                        color: AppColors.softWhite,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                storyDetails.title,
                                style: boldSize20Text(AppColors.deepNavy),
                              ),
                              mediumVerticalSizedBox,
                              Row(
                                children: [
                                  Text(
                                    _formatDate(storyDetails.date),
                                    style: normalSize12Text(AppColors.floaidPurple),
                                  ),
                                  smallHorizontalSizedBox,
                                 const Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color: AppColors.lightCyan
                                  ),
                                  verySmallHorizontalSizedBox,
                                  Text(
                                    '3 mins',
                                    style: normalSize12Text(AppColors.lightGray),
                                  ),
                                ],
                              ),
                              mediumVerticalSizedBox,
                              Container(
                                height: 1,
                                color: AppColors.blueGray.withValues(alpha: .1),
                              ),
                              mediumVerticalSizedBox,
                              Text(
                                storyDetails.plainTextContent ?? storyDetails.content,
                                style: normalSize14Text(AppColors.deepBlue).copyWith(
                                  height: 1.6,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      mediumVerticalSizedBox,
                      
                      veryLargeVerticalSizedBox,
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