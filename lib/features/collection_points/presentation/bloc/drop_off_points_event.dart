part of 'drop_off_points_bloc.dart';

abstract class DropOffPointsEvent extends Equatable {
  const DropOffPointsEvent();

  @override
  List<Object> get props => [];
}

class FetchDropOffPointsEvent extends DropOffPointsEvent {
  const FetchDropOffPointsEvent();

  @override
  List<Object> get props => [];
}