import 'package:equatable/equatable.dart';

class DayHoursEntity extends Equatable {
  final String? open;
  final String? close;
  final bool? closed;

  const DayHoursEntity({
    this.open,
    this.close,
    this.closed,
  });

  @override
  List<Object?> get props => [open, close, closed];
}

class OperatingHoursEntity extends Equatable {
  final DayHoursEntity monday;
  final DayHoursEntity tuesday;
  final DayHoursEntity wednesday;
  final DayHoursEntity thursday;
  final DayHoursEntity friday;
  final DayHoursEntity saturday;
  final DayHoursEntity sunday;

  const OperatingHoursEntity({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  @override
  List<Object> get props => [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  ];
}