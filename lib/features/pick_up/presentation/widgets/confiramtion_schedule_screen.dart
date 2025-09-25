import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/home/presentation/bloc/navigation_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/confirmation_checker_section.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/confirmation_pickup_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessScheduleBottomSheet extends StatelessWidget {
  const SuccessScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            largeVerticalSizedBox,
            const ConfirmationCheckerSection(),
            mediumVerticalSizedBox,
            const ConfirmationPickupDetails(),
            mediumVerticalSizedBox,
            _buildConformtionScreenButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildConformtionScreenButton(context) {
    return Material(
      child: BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Add2Calendar.addEvent2Cal(
                    Event(
                      title: 'FloAid Donation',
                      description: 'Donation pick by FloAid Team',
                      location: state.currentForm.address,
                      startDate: DateTime.parse(state.currentForm.pickupDate),
                      endDate: DateTime.parse(
                        state.currentForm.pickupDate,
                      ).add(const Duration(minutes: 30)),
                      iosParams: const IOSParams(
                        reminder: Duration(minutes: 40),
                        // url: 'http://example.com',
                      ),
                      androidParams: const AndroidParams(
                        // emailInvites: ['test@example.com'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.blueGray,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      smallHorizontalSizedBox,
                      Text(
                        'Add to Calendar',
                        style: boldSize15Text(AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
              smallVerticalSizedBox,
              InkWell(
                onTap: () {
                  context.read<SchedulePickupBloc>().add(
                    ScheduleFormResetEvent(),
                  );

                  context.read<NavigationBloc>().add(
                    const ChangeCurrentEvent(currentIndex: 0),
                  );
                  // Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.floaidPink, AppColors.floaidPurple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        color: AppColors.whiteColor,
                        size: 16,
                      ),
                      smallHorizontalSizedBox,
                      Text(
                        'Go back home',
                        style: boldSize15Text(AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
