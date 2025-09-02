import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_dropdownmenu.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonationDetails extends StatelessWidget {
  final String? dropDownValue;
  final List<String> items;
  const DonationDetails({super.key,  this.dropDownValue, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MultiFormSkeleton(
        title: 'Donation Details',
        children: [
          mediumVerticalSizedBox,
           Row(
          children: [
             const Icon(FontAwesomeIcons.cube, color: AppColors.floaidPurple, size: 15, weight: 100),
              smallHorizontalSizedBox, 
            Text('What are you donating*', style: boldSize15Text(AppColors.deepNavy)),
          ],
        ),
         smallVerticalSizedBox,
        FloAidCustomDropDownMenu(
            dropDownValue:dropDownValue,
            hintText: 'Select donation type',
            items:  items 
            )
          
      
          
        ],
        
      ),
    );
  }
}