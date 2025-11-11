import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class StoriesCard extends StatelessWidget {
  final String imageUrl;
  final String storyTitle;
  final DateTime postedAt;       
  final String readDuration; 

  const StoriesCard({
    super.key, 
    required this.imageUrl, 
    required this.storyTitle, 
    required this.postedAt, 
    required this.readDuration
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.softWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 2,   
          color: Colors.transparent         
        ),
        borderRadius: BorderRadius.circular(24), 
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),  
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primaryPink,
                      AppColors.floaidPurple,
                      AppColors.primaryPink,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryPink.withValues(alpha: .3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
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
                        child:  const Center(
                          child: Icon(
                            Icons.article_outlined,
                            color: AppColors.softWhite,
                            size: 36,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              mediumHorizontalSizedBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      storyTitle,
                      style: boldSize14Text(AppColors.deepNavy),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    smallVerticalSizedBox,
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.floaidPurple.withValues(alpha: .5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '$readDuration read',
                            style: boldSize10Text(AppColors.floaidPurple),
                          ),
                        ),
                        smallHorizontalSizedBox,
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: AppColors.lightGray
                        ),
                        verySmallHorizontalSizedBox,
                        Text(
                          readDuration,
                          style: normalSize11Text(AppColors.lightGray),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}