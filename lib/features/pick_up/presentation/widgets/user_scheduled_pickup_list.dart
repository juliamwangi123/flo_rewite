import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/get_users_scheduled_pickups_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/schedule_pickup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScheduledPickupList extends StatefulWidget {
  const UserScheduledPickupList({super.key});

  @override
  State<UserScheduledPickupList> createState() =>
      _UserScheduledPickupListState();
}

class _UserScheduledPickupListState extends State<UserScheduledPickupList> {
  @override
  void initState() {
    super.initState();
    final uId = context.read<AuthBloc>().state.user?.uuid;
    context.read<GetUsersScheduledPickupsBloc>().add(
      FetchUserScheduledPickUpsEvent(userId: uId ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetUsersScheduledPickupsBloc,
      GetUsersScheduledPickupsState
    >(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.scheduledPickup?.length,
          itemBuilder: (BuildContext context, int index) {
            final pickups = state.scheduledPickup?[index];

            return SchedulePickCard(
              scheduleId: '123',
              scheduleStatus: true,
              scheduleDate: pickups?.pickupDate ?? '',
              timeSlot: pickups?.pickupTime ?? '',
              location: pickups?.address ?? '',
              landmark: pickups?.landmark ?? '',
              donation: pickups?.donationType ?? '',
              typeOfDonation: pickups?.typeOfDonation ?? '',
            );
          },
        );
      },
    );
  }
}
