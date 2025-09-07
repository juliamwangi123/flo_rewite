import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickUpLocationDetails extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController landmarkController;
  final TextEditingController accessInstructionsController;

  const PickUpLocationDetails({
    super.key,
    required this.addressController,
    required this.landmarkController,
    required this.accessInstructionsController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return MultiFormSkeleton(
          title: 'Pickup Location',
          children: [
            mediumVerticalSizedBox,
            PersonalDetailsItemWidget(
              initialValue: state.currentForm.address,
              label: 'Address',
              hintText: 'Complete pickup address',
              icon: Icons.location_on_outlined,
              maxLines: 2,
              onchanged: (value) {
                context.read<SchedulePickupBloc>().add(
                  UpdateFormFieldEvent(field: 'address', value: value),
                );
              },
            ),
            smallVerticalSizedBox,
            PersonalDetailsItemWidget(
              initialValue: state.currentForm.landmark,
              label: 'Landmark/Building',
              hintText: 'Building name , nearby shop etc',
              onchanged: (value) {
                context.read<SchedulePickupBloc>().add(
                  UpdateFormFieldEvent(field: 'landmark', value: value),
                );
              },
            ),
            smallVerticalSizedBox,
            PersonalDetailsItemWidget(
              initialValue: state.currentForm.accessInstructions ?? '',
              label: 'Access Instructions',
              hintText: 'Gate code, security info, best time to call..',
              maxLines: 3,
              onchanged: (value) {
                context.read<SchedulePickupBloc>().add(
                  UpdateFormFieldEvent(field: 'accessInstructions', value: value),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
