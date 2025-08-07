import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/data_types/no_params.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/entity/drop_off_points_entity.dart';
import 'package:floo_aid_rewrite/features/collection_points/domain/usecase/drop_off_point_usecase.dart';

part 'drop_off_points_event.dart';
part 'drop_off_points_state.dart';

class DropOffPointsBloc extends Bloc<DropOffPointsEvent, DropOffPointsState> {
  final DropOffPointUsecase dropOffPointUsecase;  
  DropOffPointsBloc(this.dropOffPointUsecase) : super(const DropOffPointsState()) {
    on<FetchDropOffPointsEvent>(_onFetchDropOffPoints);

  }
  void _onFetchDropOffPoints(FetchDropOffPointsEvent event, Emitter<DropOffPointsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final failureOrPoints = await dropOffPointUsecase(NoParams());
    failureOrPoints.fold(
      (failure) => emit(state.copyWith(
          isLoading: false,
          errorMessage: (failure as ServerFailure).message)),
      (points) => emit(state.copyWith(isLoading: false, dropOffPoints: points, errorMessage: null)),
    );
  }
}
