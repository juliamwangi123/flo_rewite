part of 'address_recommendation_bloc.dart';

abstract class AdressRecommendationEvent extends Equatable {
  const AdressRecommendationEvent();

  @override
  List<Object> get props => [];
}
class FetchAddressSuggestionsEvent extends AdressRecommendationEvent {
  final String query;

  const FetchAddressSuggestionsEvent(this.query);

  @override
  List<Object> get props => [query];
}