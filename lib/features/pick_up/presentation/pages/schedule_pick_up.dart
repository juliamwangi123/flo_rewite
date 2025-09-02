import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/pickup_location_details.dart';
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

  int currentStep = 0;
  bool goToNextStep(){
    if(
      fullNameController.text.isNotEmpty &&
      phoneNumberController.text.isNotEmpty &&
      addressController.text.isNotEmpty &&
      landmarkController.text.isNotEmpty 
    ){
      
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
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
                  isButtonActive: goToNextStep()  ? true : false,
                  handleSubmitButton: () {
                    setState(() {
                      currentStep  += 1;
                      
                    });
                  }
                ),
                mediumVerticalSizedBox,
               ],
             )
             ),
         ),
       )
      ],
    );
  }
}