import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
import 'package:floo_aid_rewrite/core/routes/routes.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_floaid_button.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/donation_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/pickup_location_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/schedule_pickups.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePickUp extends StatefulWidget {
  const SchedulePickUp({super.key});

  @override
  State<SchedulePickUp> createState() => _SchedulePickUpState();
}

class _SchedulePickUpState extends State<SchedulePickUp> {
  final _formKey = GlobalKey<FormState>();
  List<String> donationTypes = ['Individual', 'Organization'];
  final List<String> donationItems = [
    'Boxes Of Pads (atleast  min 3 boxes)',
    'Individual pack (at least  min 20  packs)',
  ];
 final List<String> timeSlots = [
  '9.00 - 10.00 AM',
  '10.00 - 11.00 AM',
  '11.00 AM - 12.00 PM',
  '12.00 - 1.00 PM',
  '1.00 - 2.00 PM',
  '2.00 - 3.00 PM',
  '3.00 - 4.00 PM',
  '4.00 - 5.00 PM',
  '5.00 - 6.00 PM',
];

  int currentStep = 1;
  bool isButtonAcive = false;
  String? selectedTimeSlot;
  String? donationTypeValue;
  bool? isGradient;
  bool? isLoading;
  bool hasNavigatedToSuccess = true;
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mediumVerticalSizedBox,
          StepIndicator(currentPage: currentStep),
          mediumVerticalSizedBox,
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
                listener: (context, state) {
                  if (state.scheduledPickup != null && hasNavigatedToSuccess) { 
                    Navigator.pushNamed(context, AppRoutes.scheduleSuccessScreen);
                    setState(() {
                      hasNavigatedToSuccess = false;
                    });
                 }  
                 if(state.isLoading == true){
                  isLoading = state.isLoading;
                 }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        if (currentStep == 0)
                          Column(
                            children: [
                              PersonalDetails(
                                donationTypes: donationTypes
                                ),
                              mediumVerticalSizedBox,
                             const PickUpLocationDetails(
                              ),
                              mediumVerticalSizedBox,
                            ],
                          )
                        else
                          Column(
                            children: [
                              DonationDetails(
                                items: donationItems,
                                dropDownValue: donationTypeValue,
                                onChanged: (value) {
                                  donationTypeValue = value;
                                  context.read<SchedulePickupBloc>().add(
                                    UpdateFormFieldEvent(
                                      field: 'typeOfDonation',
                                      value: value,
                                    ),
                                  );
                                },
                              ),
                              mediumVerticalSizedBox,
                              SchedulePickupWidget(
                                items: timeSlots,
                                dropDownValue: selectedTimeSlot,
                                onChanged: (value) {
                                  selectedTimeSlot = value;
                                  context.read<SchedulePickupBloc>().add(
                                    UpdateFormFieldEvent(
                                      field: 'pickupTime',
                                      value: value,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        mediumVerticalSizedBox,
                        if (currentStep == 1) mediumVerticalSizedBox,
                        Row(
                          children: [
                            if (currentStep > 0) ...[
                              Expanded(
                                child: CustomFloAidButton(
                                  buttonText: 'Back',
                                  isGradient: true,
                                  buttonColor:Colors.transparent,
                                  isButtonActive: true,
                                  handleSubmitButton: () {
                                    setState(() {
                                      currentStep -= 1;
                                    });
                                  },
                                ),
                              ),
                              smallHorizontalSizedBox,
                            ],
                            Expanded(
                              child: CustomFloAidButton(
                                isLoading: isLoading ?? false,
                                buttonText:
                                    currentStep == 0
                                        ? 'Continue'
                                        : 'Schedule Pickup',
                                isGradient: true,
                                buttonColor: Colors.red,
                                isButtonActive:
                                    (currentStep == 0 &&
                                        state.currentForm.fullName.isNotEmpty &&
                                        state
                                            .currentForm
                                            .phoneNumber
                                            .isNotEmpty &&
                                        state.currentForm.address.isNotEmpty &&
                                        state
                                            .currentForm
                                            .donationType
                                            .isNotEmpty &&
                                        state.currentForm.landmark.isNotEmpty)||
                                (currentStep == 1 &&
                                state.currentForm.typeOfDonation.isNotEmpty &&
                                 state.currentForm.pickupDate.isNotEmpty &&
                                 state.currentForm.pickupTime.isNotEmpty),
                                handleSubmitButton: () {
                                  if (currentStep == 0) {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                   
                                  } else {
                                    if(_formKey.currentState!.validate()){
                                    context.read<SchedulePickupBloc>().add(
                                      SchedulePickupRequestEvent(
                                        schedulePickupParams:
                                            SchedulePickupParams(
                                              fullName: state.currentForm.fullName,
                                              phoneNumber:state.currentForm.phoneNumber,
                                              address: state.currentForm.address,
                                              landmark: state.currentForm.landmark,
                                              accessInstructions:state.currentForm.accessInstructions,    
                                              donationType: state.currentForm.donationType,
                                              typeOfDonation: state.currentForm.typeOfDonation,      
                                              pickupDate: state.currentForm.pickupDate,
                                              pickupTime: state.currentForm.pickupTime,
                                            ),
                                      ),
                                    );
                                    
                                    _formKey.currentState!.reset();
                                    setState(() {                               
                                    });
                                    
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
