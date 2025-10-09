import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/entity/schedule_pickup_entity.dart';
import 'package:floo_aid_rewrite/features/pick_up/domain/usecase/get_user_scheduled_pickups.dart';
part 'get_users_scheduled_pickups_event.dart';
part 'get_users_scheduled_pickups_state.dart';

class GetUsersScheduledPickupsBloc
    extends Bloc<GetUsersScheduledPickupsEvent, GetUsersScheduledPickupsState> {
  final GetUserScheduledPickupsUseCase getUserScheduledPickupsUseCase;

  GetUsersScheduledPickupsBloc(this.getUserScheduledPickupsUseCase)
    : super(const GetUsersScheduledPickupsState()) {
    on<FetchUserScheduledPickUpsEvent>(_onGetUserScheduledPickups);
  }

  void _onGetUserScheduledPickups(
    FetchUserScheduledPickUpsEvent event,
    Emitter<GetUsersScheduledPickupsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final getUserSchedledPickupOrFailure = await getUserScheduledPickupsUseCase(
      event.userId,
    );
    getUserSchedledPickupOrFailure.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message,
        ),
      ),
      (getUserSchedledPickup) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: null,
          scheduledPickup: getUserSchedledPickup,
        ),
      );
      }
    );
  }
}
