import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/donation_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/pickup_location_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/schedule_pickups.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

class SchedulePickUp extends StatefulWidget {
  
  const SchedulePickUp({super.key});

  @override
  State<SchedulePickUp> createState() => _SchedulePickUpState();
}

class _SchedulePickUpState extends State<SchedulePickUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController accessInstructionsController = TextEditingController();
  List<String> donationTypes = ['Individual', 'Organization'];
  final List<String> donationItems = ['Boxes Of Pads (atleast  min 3 boxes)', 'Individual pack (at least  min 20  packs)' ];
  final List<String> timeSlots = [
  '9-10',
  '10-11',
  '11-12',
  '12-1',
  '1-2',
  '2-3',
  '3-4',
  '4-5',
  '5-6',
];



int currentStep = 1;
bool isButtonAcive = false;

 bool get isButtonActive {
    return fullNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        landmarkController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
      FocusScope.of(context).unfocus(); // Closes keyboard
    },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mediumVerticalSizedBox,
         StepIndicator(
            currentPage: currentStep
         ),
         mediumVerticalSizedBox,
         Expanded(
           child: SingleChildScrollView(
             child: Form(
                key: _formKey,
               child: Column(
                 children: [
                    if (currentStep == 0)
                  Column(
                    children: [
                      PersonalDetails(
                    fullNameController:fullNameController ,
                    phoneNumberController: phoneNumberController,
                    donationTypes: donationTypes
                 ),
                  mediumVerticalSizedBox,
                 PickUpLocationDetails(
                  addressController: addressController,
                  landmarkController: landmarkController,
                  accessInstructionsController: accessInstructionsController
      
                 ),
                 mediumVerticalSizedBox,
                 CustomFloAidButton(
                    buttonText: currentStep == 0 ? 'Continue' : 'Schedule Pickup',
                    isButtonActive: isButtonActive,
                    handleSubmitButton: () {
                      setState(() {
                        currentStep  += 1;
                        
                      });
                    }
                  ),
                  mediumVerticalSizedBox,
                    ],
                  )
                  else Column(
                    children: [
                       DonationDetails(
                        // dropDownValue: donationItems[0],
                        items:donationItems
                       ),
                        mediumVerticalSizedBox,
                       SchedulePickupWidget(
                        // dropDownValue: donationItems[0],
                        items: timeSlots
                       ),
                    ],
                  ) 
      
                 
                  
                 ],
               )
               ),
           ),
         )
        ],
      ),
    );
  }
}