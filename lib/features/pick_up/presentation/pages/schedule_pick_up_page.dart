import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/header_schedule_pickup.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/user_scheduled_pickup_list.dart';
import 'package:flutter/widgets.dart';

class SchedulePickUpScreen extends StatelessWidget {
  const SchedulePickUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.softWhite.withValues(alpha: 0.2),
      child: Column(
        children: [
          const HeaderSchedulePickup(),
          smallVerticalSizedBox,
          smallVerticalSizedBox,
         const Expanded(child: UserScheduledPickupList()),
        ],
      ),
    );
  }
}
