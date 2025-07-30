part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrentEvent extends NavigationEvent{
  final int currentIndex;
  const ChangeCurrentEvent({required this.currentIndex});

    @override
  List<Object> get props => [currentIndex];
}