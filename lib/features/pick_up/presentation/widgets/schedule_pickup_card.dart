import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulePickCard extends StatelessWidget {
  final String scheduleId;
  final bool scheduleStatus;
  final String scheduleDate;
  final String timeSlot;
  final String location;
  final String landmark;
  final String donation;
  final String typeOfDonation;
  final VoidCallback handleCancelPickUp;
  final VoidCallback handleEditPickUp;
  final bool showActionButton;

  const SchedulePickCard({
    super.key, 
    required this.scheduleId, 
    required this.scheduleStatus, 
    required this.scheduleDate, 
    required this.timeSlot, 
    required this.location, 
    required this.landmark, 
    required this.donation, 
    required this.typeOfDonation,
    required this.handleCancelPickUp,
    required this.handleEditPickUp,
    required this.showActionButton
    });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(17),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //  color: AppColors.whiteColor,
          // borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(scheduleId, style: boldSize16Text()),
                smallHorizontalSizedBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        scheduleStatus == true
                            ? AppColors.warningAmber.withValues(alpha: .3)
                            : AppColors.lightGreenish,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        scheduleStatus == true
                            ? Icons.hourglass_bottom
                            : Icons.check,
                        size: 13,
                        color:
                            scheduleStatus == true
                                ? AppColors.warningAmber
                                : AppColors.darkGreen,
                      ),

                      Text(
                        scheduleStatus == true ? 'Pending' : 'Completed',
                        style: normalSize11Text(
                          scheduleStatus == true
                              ? AppColors.warningAmber
                              : AppColors.darkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verySmallVerticalSizedBox,
            Text(
              'Scheduled. Can be edited ',
              style: normalSize11Text(AppColors.lightGray),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.floaidPink,
                  size: 15,
                  weight: 100,
                ),
                smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallVerticalSizedBox,
                    verySmallVerticalSizedBox,
                    Text(scheduleDate, style: boldSize13Text()),
                    Text(
                      timeSlot,
                      style: normalSize14Text(AppColors.lightGray),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.floaidPink,
                  size: 20,
                  weight: 100,
                ),
                 smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallVerticalSizedBox,
                    verySmallVerticalSizedBox,
                    Text(location, style: boldSize13Text()),
                    Text(landmark, style: normalSize14Text(AppColors.lightGray)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  FontAwesomeIcons.cube,
                  color: AppColors.floaidPink,
                  size: 15,
                  weight: 100,
                ),
                smallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallVerticalSizedBox,
                    verySmallVerticalSizedBox,
                    Text(donation, style: boldSize13Text()),
                    Text(
                      typeOfDonation,
                      style: normalSize14Text(AppColors.lightGray),
                    ),
                  ],
                ),
              ],
            ),
            smallVerticalSizedBox,
          if (showActionButton)...[
            const Divider(thickness: 1, color: AppColors.veryLightGray),
            smallVerticalSizedBox,

          Row(
              children: [
                Expanded(
                  child: PickUpActionButton(
                    backgroundColor: AppColors.floaidPink,
                    buttonLabel: 'Edit Details',
                    iconData: Icons.edit_outlined,
                    buttonLabelColor: AppColors.floaidPink,
                    isEditButton: true,
                    onTap: handleEditPickUp
                  ),
                ),
                smallHorizontalSizedBox,
                Expanded(
                  child: PickUpActionButton(
                    backgroundColor: AppColors.lightGray,
                    buttonLabel: 'Cancel',
                    iconData: Icons.close_rounded,
                    buttonLabelColor: AppColors.deepNavy,
                    isEditButton: false,
                    onTap: handleCancelPickUp
                  ),
                ),
              ],
            )]
          ],
        ),
      ),
    );
  }
}

class PickUpActionButton extends StatelessWidget {
  final String buttonLabel;
  final IconData iconData;
  final Color backgroundColor;
  final Color? buttonLabelColor;
  final bool isEditButton;
  final void Function() onTap;

  const PickUpActionButton({
    super.key,
    required this.buttonLabel,
    required this.iconData,
    required this.backgroundColor,
    this.buttonLabelColor = AppColors.deepNavy,
    required this.isEditButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isEditButton)
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(),
                ),
                child: Center(
                  child: Icon(iconData, color: buttonLabelColor, size: 13),
                ),
              )
            else
              Icon(iconData, color: backgroundColor, size: 16),
            verySmallHorizontalSizedBox,
            Text(buttonLabel, style: normalSize13Text(buttonLabelColor)),
          ],
        ),
      ),
    );
  }
}
