import 'package:floo_aid_rewrite/core/data_types/schedule_pickup_params.dart';
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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController accessInstructionsController = TextEditingController();
  List<String> donationTypes = ['Individual', 'Organization'];
  final List<String> donationItems = [
    'Boxes Of Pads (atleast  min 3 boxes)',
    'Individual pack (at least  min 20  packs)',
  ];
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

  int currentStep = 0;
  bool isButtonAcive = false;
  String? selectedTimeSlot;
  String? donationTypeValue;

  bool get isButtonActive {
    return fullNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        landmarkController.text.isNotEmpty;
  }

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
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (currentStep == 0)
                          Column(
                            children: [
                              PersonalDetails(donationTypes: donationTypes),
                              mediumVerticalSizedBox,
                              PickUpLocationDetails(
                                addressController: addressController,
                                landmarkController: landmarkController,
                                accessInstructionsController:
                                    accessInstructionsController,
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
                                buttonText:
                                    currentStep == 0
                                        ? 'Continue'
                                        : 'Schedule Pickup',
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
                                        state.currentForm.landmark.isNotEmpty),
                                // ||
                                // (currentStep == 1 &&
                                // state.currentForm.typeOfDonation.isNotEmpty &&
                                //  state.currentForm.pickupDate.isNotEmpty &&
                                //  state.currentForm.pickupTime.isNotEmpty),
                                handleSubmitButton: () {
                                  if (currentStep == 0) {
                                    setState(() {
                                      currentStep += 1;
                                    });
                                   
                                  } else {
                                    context.read<SchedulePickupBloc>().add(
                                      SchedulePickupRequestEvent(
                                        schedulePickupParams:
                                            SchedulePickupParams(
                                              fullName: fullNameController.text,
                                              phoneNumber:
                                                  phoneNumberController.text,
                                              address: addressController.text,
                                              landmark: landmarkController.text,
                                              accessInstructions:
                                                  accessInstructionsController
                                                      .text,
                                              donationType: donationTypeValue!,
                                              typeOfDonation:
                                                  donationTypeValue!,
                                              pickupDate: '2024-07-20',
                                              pickupTime: '9-10',
                                            ),
                                      ),
                                    );
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
