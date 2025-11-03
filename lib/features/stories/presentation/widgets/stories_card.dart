import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class StoriesCard extends StatelessWidget {
  final String imageUrl;
  final String storyTitle;
  final  DateTime postedAt;       
  final String readDuration; 

  const StoriesCard({super.key, 
  required this.imageUrl, 
  required this.storyTitle, 
  required this.postedAt, 
  required this.readDuration});

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
      borderRadius: BorderRadius.circular(12), 
        ),
      child: ListTile(
        leading:  Image.network(imageUrl),
        title: Text(
          storyTitle,
          style:  boldSize15Text(AppColors.deepNavy),
          maxLines: 2,

        ),
        subtitle: Row(
          children: [
            Text(
          postedAt.day.toString(),
          style:  normalSize12Text(AppColors.deepNavy),
        ),
        smallHorizontalSizedBox,
         Text(
          '.',
          style: normalSize12Text(AppColors.deepNavy),
        ),
        smallHorizontalSizedBox,
          Row(
            children: [
              const  Icon(Icons.schedule_outlined, size: 12,),
              verySmallHorizontalSizedBox,
              Text(
              readDuration,
              style: normalSize12Text(AppColors.deepNavy),
              ),
            ],
          ),
          ],
        ),
      contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      
      ),
    );
  }
}