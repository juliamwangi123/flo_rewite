import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/header_schedule_pickup.dart';
import 'package:flutter/widgets.dart';

class SchedulePickUpScreen extends StatelessWidget {
  const SchedulePickUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: [
        HeaderSchedulePickup()
      ],
    );
  }
}