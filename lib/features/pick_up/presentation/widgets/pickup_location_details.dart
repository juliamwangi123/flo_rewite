import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:flutter/material.dart';

class PickUpLocationDetails extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController landmarkController;
  final TextEditingController accessInstructionsController;

  const PickUpLocationDetails({
    super.key, 
    required this.addressController, 
    required this.landmarkController, 
    required this.accessInstructionsController});

  @override
  Widget build(BuildContext context) {
    return MultiFormSkeleton(
      title: 'Pickup Location' ,
      children: [
        mediumVerticalSizedBox,
          PersonalDetailsItemWidget(
          controller: addressController,
          label: 'Address', 
          hintText: 'Complete pickup address', 
          icon: Icons.location_on_outlined,
          maxLines: 2,
        ),
        smallVerticalSizedBox,
        PersonalDetailsItemWidget(
          controller: landmarkController,
          label: 'Landmark/Building', 
          hintText: 'Building name , nearby shop etc', 
        ),
        smallVerticalSizedBox,
        PersonalDetailsItemWidget(
          controller: accessInstructionsController,
          label: 'Access Instructions', 
          hintText: 'Gate code, security info, best time to call..', 
          maxLines: 3,
        ),
        
      ],

      
    );
  }
}