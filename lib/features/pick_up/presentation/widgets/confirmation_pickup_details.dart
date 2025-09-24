import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationPickupDetails extends StatelessWidget {
  const ConfirmationPickupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            ResuableConfirmationConatiner(
              backgroundColor: AppColors.lightBackground,
              children: [
                _buildDetailRow(context, 'Pickup ID:', '#123456'),
                _buildDetailRow(context, 'Date:', state.currentForm.pickupDate),
                _buildDetailRow(context, 'Time:', state.currentForm.pickupTime),
                _buildDetailRow(context, 'Location:', state.currentForm.address),
                _buildDetailRow(context, 'Donation Type:', state.currentForm.typeOfDonation),
                _buildDetailRow(
                  context,
                  'Donation:',
                  state.currentForm.donationType
                ),
              ],
            ),
            mediumVerticalSizedBox,
            ResuableConfirmationConatiner(
              backgroundColor: AppColors.lightBackground,
              isMoreInfoContainer: true,
              children: [
                _buildDetailRow(
                  context,
                  '1',
                  "We'll send you a confirmation SMS with pickup details",
                  isMoreInfoContainer: true,
                ),
                smallVerticalSizedBox,
                _buildDetailRow(
                  context,
                  '2',
                  'Our team will arrive at your location within the scheduled time slot',
                  isMoreInfoContainer: true,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isMoreInfoContainer = false,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMoreInfoContainer)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(label, style: normalSize16Text(AppColors.blueGray)),
              )
            else
              Container(
                height: 24,
                width: 24,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: AppColors.floaidPurple,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: normalSize16Text(
                      AppColors.whiteColor,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (!isMoreInfoContainer)
              largeHorizontalSizedBox
            else
              smallHorizontalSizedBox,
            Expanded(
              child: Text(
                value,
                style: normalSize16Text(
                  !isMoreInfoContainer
                      ? AppColors.deepNavy
                      : AppColors.whiteColor,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
        verySmallVerticalSizedBox,
      ],
    );
  }
}

class ResuableConfirmationConatiner extends StatelessWidget {
  final List<Widget> children;
  final Color backgroundColor;
  final bool? isMoreInfoContainer;
  const ResuableConfirmationConatiner({
    super.key,
    required this.children,
    required this.backgroundColor,
    this.isMoreInfoContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: backgroundColor,
        gradient:
            isMoreInfoContainer == true
                ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.floaidPink.withValues(alpha: .9),
                    AppColors.floaidPurple.withValues(alpha: 0.8),
                  ],
                )
                : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
