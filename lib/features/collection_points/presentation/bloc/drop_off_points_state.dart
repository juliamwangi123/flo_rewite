part of 'drop_off_points_bloc.dart';

class DropOffPointsState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<DropOffPointsEntity>? dropOffPoints;

  const DropOffPointsState({
    this.isLoading = false,
    this.errorMessage = '',
    this.dropOffPoints = const [],
  });

  DropOffPointsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<DropOffPointsEntity>? dropOffPoints,
  }) {
    return DropOffPointsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      dropOffPoints: dropOffPoints ?? this.dropOffPoints,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, dropOffPoints ];
}
