import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure(this.message);
}