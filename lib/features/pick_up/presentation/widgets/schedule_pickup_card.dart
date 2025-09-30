import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SchedulePickCard extends StatelessWidget {
  const SchedulePickCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool? ispending;
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
                Text('#123456', style: boldSize16Text()),
                smallHorizontalSizedBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        ispending == true
                            ? AppColors.warningAmber.withValues(alpha: .3)
                            : AppColors.lightGreenish,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        ispending == true
                            ? Icons.hourglass_bottom
                            : Icons.check,
                        size: 13,
                        color:
                            ispending == true
                                ? AppColors.warningAmber
                                : AppColors.darkGreen,
                      ),

                      Text(
                        ispending == true ? 'Pending' : 'Completed',
                        style: normalSize11Text(
                          ispending == true
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
              'Scheduled. Can be edited',
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
                    Text('2025-09-30', style: boldSize13Text()),
                    Text(
                      '11-12 PM',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallVerticalSizedBox,
                    verySmallVerticalSizedBox,
                    Text('Nairobi', style: boldSize13Text()),
                    Text('Karen', style: normalSize14Text(AppColors.lightGray)),
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
                    Text('Boxes Of pads(13 boxes)', style: boldSize13Text()),
                    Text(
                      'Individual Donation',
                      style: normalSize14Text(AppColors.lightGray),
                    ),
                  ],
                ),
              ],
            ),
            smallVerticalSizedBox,
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
                    onTap: () {},
                  ),
                ),
                smallHorizontalSizedBox,
                Expanded(
                  child: PickUpActionButton(
                    backgroundColor: AppColors.lightGray,
                    buttonLabel: 'Edit Label',
                    iconData: Icons.close_rounded,
                    buttonLabelColor: AppColors.deepNavy,
                    isEditButton: false,
                    onTap: () {},
                  ),
                ),
              ],
            ),
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
