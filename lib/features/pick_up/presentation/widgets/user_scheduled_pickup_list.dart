import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_snackbar.dart';
import 'package:floo_aid_rewrite/core/widgets/floaid_dialoog.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/pages/schedule_pick_up_form.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/floaid_emptystate.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/auth/presenataion/bloc/auth_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/cancel_scheduled_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/get_users_scheduled_pickups_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/schedule_pickup_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final uId = context.read<AuthBloc>().state.user?.uuid;
      if (uId != null) {
        context.read<GetUsersScheduledPickupsBloc>().add(
          FetchUserScheduledPickUpsEvent(userId: uId),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelScheduledPickupBloc, CancelScheduledPickupState>(
      listener: (context, cancelState) {
        if (cancelState.isCancelledSucceffully == true &&
            cancelState.errorMessage == null) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          showCustomSnackBar(
            context,
            'Cancelled  pickup successfully',
            AppColors.successGreen,
            AppColors.whiteColor,
          );
        } else if (cancelState.errorMessage != null &&
            cancelState.isCancelledSucceffully == false) {
          showCustomSnackBar(
            context,
            'Failed to cancel pickup',
            AppColors.errorRed,
            AppColors.whiteColor,
          );
        }
      },
      builder: (context, cancelState) {
        return BlocConsumer<
          GetUsersScheduledPickupsBloc,
          GetUsersScheduledPickupsState
        >(
          listener: (context, pickupState) {},
          builder: (context, pickupState) {
            if(pickupState.scheduledPickup == null || pickupState.scheduledPickup!.isEmpty){
              return const PickupsEmptyState();
            }else{
            return Skeletonizer(
              enabled: pickupState.isLoading == true,
              child: ListView.separated(
                itemCount: pickupState.scheduledPickup?.length ?? 1,
                separatorBuilder: (context, index) {
                  return mediumVerticalSizedBox;
                },
                itemBuilder: (BuildContext context, int index) {
                  final pickups = pickupState.scheduledPickup?[index];
                  bool canEditPickup = false;
                  if (pickups?.createdAt != null) {
                    final createdAt = DateTime.fromMicrosecondsSinceEpoch(pickups?.createdAt ?? 0);
                    final now = DateTime.now();
                    final hoursSinceCreation = now.difference(createdAt).inHours;
                    
                    canEditPickup = hoursSinceCreation < 12; 
                    debugPrint('can edit: $canEditPickup');
                  }
                  return SchedulePickCard(
                  scheduleId: pickups != null && pickups.id != null && pickups.id!.length >= 5
                                ? pickups.id!.substring(pickups.id!.length - 5)
                                : pickups?.id ?? '',
                    scheduleStatus: true,
                    scheduleDate: pickups?.pickupDate ?? '',
                    timeSlot: pickups?.pickupTime ?? '',
                    location: pickups?.address ?? '',
                    landmark: pickups?.landmark ?? '',
                    donation: pickups?.donationType ?? '',
                    typeOfDonation: pickups?.typeOfDonation ?? '',
                    showActionButton:canEditPickup ,
                    handleCancelPickUp: () {
                      FloAidDialog.show(
                        context: context,
                        type: DialogType.danger,
                        icon: '🗑️',
                        title: 'Delete Pickup?',
                        message: 'This action cannot be undone.',
                        confirmText: 'Delete',
                        cancelText: 'Cancel',
                        isLoading: cancelState.isLoading,
                        onConfirm: () {
                          final id = pickups?.id;
                          if (id != null) {
                            context.read<CancelScheduledPickupBloc>().add(
                              HandleCancelScheduledPickupEvent(id: id),
                            );
                          }
                          final uId = context.read<AuthBloc>().state.user?.uuid;
                          if (uId != null) {
                            context.read<GetUsersScheduledPickupsBloc>().add(
                              FetchUserScheduledPickUpsEvent(userId: uId),
                            );
                          }
                        },
                      );
                    },
                    handleEditPickUp: () {
                 final pickupToEdit = pickupState.scheduledPickup?[index];
                    if (pickupToEdit != null) {
                      context.read<SchedulePickupBloc>().add(
                        InitializePickupFormEvent(entity: pickupToEdit),
                      );
                    }        
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SchedulePickUpForm(
                            schedulePickupEntity: pickupState.scheduledPickup?[index],
                          ),
                        ));
                    },
                  );
                },
              ),
            );
            }
          },
        );
      },
    );
  }
}
