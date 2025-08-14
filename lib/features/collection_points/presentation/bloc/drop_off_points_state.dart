part of 'drop_off_points_bloc.dart';

class DropOffPointsState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<DropOffPointsEntity>? dropOffPoints;
  final int? nearbyLocationLength;

  const DropOffPointsState({
    this.isLoading = false,
    this.errorMessage = '',
    this.dropOffPoints = const [],
    this.nearbyLocationLength = 0,
  });

  DropOffPointsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<DropOffPointsEntity>? dropOffPoints,
    int? nearbyLocationLength,
  }) {
    return DropOffPointsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      dropOffPoints: dropOffPoints ?? this.dropOffPoints,
      nearbyLocationLength: nearbyLocationLength ?? this.nearbyLocationLength,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, dropOffPoints, nearbyLocationLength ];
}
