import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:flutter/material.dart';

class PersonalDetails  extends StatelessWidget {
  const PersonalDetails ({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiFormSkeleton(
      title: 'Personal Details',
      children: [
         mediumVerticalSizedBox,
        const PersonalDetailsItemWidget(
          label: 'Full Name', 
          hintText: 'Enter your full name', 
          icon: Icons.person_outline
        ),
        mediumVerticalSizedBox,
       const PersonalDetailsItemWidget(
          label: 'Phone Number', 
          hintText: '0712 345 678', 
          icon: Icons.phone_outlined
        ),
        mediumVerticalSizedBox,
         const  DonationType()
      
       

       
      ],
      
    );
  }
}

class PersonalDetailsItemWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;

  const PersonalDetailsItemWidget({
    super.key, 
    required this.label, 
    required this.hintText, 
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Row(
          children: [
            Icon(icon, color: AppColors.floaidPurple, size: 18, weight: 100,),
            verySmallHorizontalSizedBox,
            Text('$label *',
            style: boldSize15Text(AppColors.deepNavy),
            )
         ],),
          smallVerticalSizedBox,
          CustomTextField(
          hintText: hintText,
          isRequired: true,
          borderColor: AppColors.lightGray.withValues(alpha: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13) 
          )

      ],
    );
  }
}

class DonationTypeSelectorItem extends StatelessWidget {
  final String buttonLabel;
  final bool isActive;
  final Color backgroundColor;
  final void Function() onTap;

  const DonationTypeSelectorItem({
    super.key, 
    required this.buttonLabel, 
    required this.isActive, 
    required this.backgroundColor,  
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.sizeOf(context).width * 0.36,
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : AppColors.lightBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? AppColors.floaidPurple.withValues(alpha: 0.6): Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: boldSize13Text(
              isActive ? AppColors.floaidPurple : AppColors.deepNavy
            )
          ),
        ),
      ),
    );
  }
}

class DonationType extends StatefulWidget {
  const DonationType({super.key});
  @override
  State<DonationType> createState() => _DonationTypeState();
}

class _DonationTypeState extends State<DonationType> {
  String selectedType = 'Individual';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
              verySmallHorizontalSizedBox,
              Text('Donation Type *',
              style: boldSize15Text(AppColors.deepNavy),
              ),
          smallVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            DonationTypeSelectorItem(
              buttonLabel: 'Individual',
              isActive: selectedType == 'Individual',
              backgroundColor: AppColors.lavendarColor.withValues(alpha: 0.3 ),        
              onTap: () {
                setState(() {
                  selectedType = 'Individual';
                });
              },
            ),
            
            
            DonationTypeSelectorItem(
              buttonLabel: 'Organization',
              isActive: selectedType == 'Organization',
              backgroundColor: AppColors.lavendarColor.withValues(alpha: 0.3 ),
              onTap: () {
                setState(() {
                  selectedType = 'Organization';
                });
              },
            ),
            
            mediumVerticalSizedBox,
          ],
        ),
      ],
    );
  }
}