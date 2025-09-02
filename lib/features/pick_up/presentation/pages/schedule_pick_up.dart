import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

class SchedulePickUp extends StatelessWidget {
  const SchedulePickUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mediumVerticalSizedBox,
       const  StepIndicator(),
       mediumVerticalSizedBox,
      const Expanded(
        child: Form(
          child: Column(
            children: [
              PersonalDetails()
            ],
          )
          ),
       )
      ],
    );
  }
}