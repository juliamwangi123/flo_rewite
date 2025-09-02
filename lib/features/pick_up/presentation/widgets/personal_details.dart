import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  final TextEditingController  fullNameController;
  final TextEditingController  phoneNumberController;
  final List<String> donationTypes;

  const PersonalDetails({
    super.key, 
    required this.fullNameController, 
    required this.phoneNumberController, 
    required this.donationTypes
    });

  @override
  Widget build(BuildContext context) {
    return MultiFormSkeleton(
      title: 'Personal Details',
      children: [
        mediumVerticalSizedBox,
        PersonalDetailsItemWidget(
          controller: fullNameController,
          label: 'Full Name',
          hintText: 'Enter your full name',
          icon: Icons.person_outline,
        ),
        mediumVerticalSizedBox,
         PersonalDetailsItemWidget(
          controller: phoneNumberController,
          label: 'Phone Number',
          hintText: '0712 345 678',
          icon: Icons.phone_outlined,
        ),
        mediumVerticalSizedBox,
        DonationType(
          donationTypes: donationTypes,
        ),
      ],
    );
  }
}

class PersonalDetailsItemWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final int? maxLines;
  final TextEditingController controller;  

  const PersonalDetailsItemWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    this.maxLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.floaidPurple, size: 18, weight: 100),
              verySmallHorizontalSizedBox,
            ],
            Text('$label *', style: boldSize15Text(AppColors.deepNavy)),
          ],
        ),
        smallVerticalSizedBox,
        CustomTextField(
          controller: controller,
          hintText: hintText,
          isRequired: true,
          borderColor: AppColors.lightGray.withValues(alpha: 0.3),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 13,
          ),
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },

        ),
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
    required this.onTap,
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
            color:
                isActive
                    ? AppColors.floaidPurple.withValues(alpha: 0.6)
                    : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: boldSize13Text(
              isActive ? AppColors.floaidPurple : AppColors.deepNavy,
            ),
          ),
        ),
      ),
    );
  }
}

class DonationType extends StatefulWidget {
  final List<String> donationTypes ;

  const DonationType({super.key, required this.donationTypes});

  @override
  State<DonationType> createState() => _DonationTypeState();
}

class _DonationTypeState extends State<DonationType> {
  late String selectedType;

  @override
  void initState() {
    selectedType = widget.donationTypes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verySmallHorizontalSizedBox,
        Text('Donation Type *', style: boldSize15Text(AppColors.deepNavy)),
        smallVerticalSizedBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DonationTypeSelectorItem(
              buttonLabel: 'Individual',
              isActive: selectedType == widget.donationTypes[0],
              backgroundColor: AppColors.lavendarColor.withValues(alpha: 0.3),
              onTap: () {
                setState(() {
                  selectedType = widget.donationTypes[0];
                });
              },
            ),

            DonationTypeSelectorItem(
              buttonLabel: 'Organization',
              isActive: selectedType ==  widget.donationTypes[1],
              backgroundColor: AppColors.lavendarColor.withValues(alpha: 0.3),
              onTap: () {
                setState(() {
                  selectedType = widget.donationTypes[1];
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
