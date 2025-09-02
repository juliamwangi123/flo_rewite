import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_dropdownmenu.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchedulePickupWidget extends StatelessWidget {
  final String? dropDownValue;
  final List<String> items;
  const SchedulePickupWidget({
    super.key,
    this.dropDownValue,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MultiFormSkeleton(
        title: 'Schedule Pickup',
        children: [
          mediumVerticalSizedBox,
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: AppColors.floaidPurple,
                size: 15,
                weight: 100,
              ),
              smallHorizontalSizedBox,
              Text('Pickup Date*', style: boldSize15Text(AppColors.deepNavy)),
            ],
          ),
          smallVerticalSizedBox,
          InkWell(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: AppColors.whiteColor,
                    content: Container(
                      width: 300,
                      height: 350,
                      color: AppColors.whiteColor,
                      
                      child: SfDateRangePicker(
                        backgroundColor: AppColors.whiteColor,
                        enablePastDates: false,
                        onSelectionChanged: (
                          DateRangePickerSelectionChangedArgs args,
                        ) {
                          // Handle date selection here
                          Navigator.of(
                            context,
                          ).pop(); // Close dialog after selection
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGray.withValues(alpha: 0.3),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'dd/mm/yyyy',
                    style:normalSize15Text(AppColors.hintTextColor),
                  ),
                 const Icon(
                    Icons.calendar_month_rounded ,
                    color: AppColors.lightGrayishGreen,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          mediumVerticalSizedBox,

          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: AppColors.floaidPurple,
                size: 15,
                weight: 100,
              ),
              smallHorizontalSizedBox,
              Text('Time Slots*', style: boldSize15Text(AppColors.deepNavy)),
            ],
          ),
          smallVerticalSizedBox,
          FloAidCustomDropDownMenu(
            dropDownValue: dropDownValue,
            hintText: 'Select time slot',
            items: items,
          ),
        ],
      ),
    );
  }
}
