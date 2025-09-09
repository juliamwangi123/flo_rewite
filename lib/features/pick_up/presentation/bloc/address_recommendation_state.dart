part of 'address_recommendation_bloc.dart';

 class AdressRecommendationState extends Equatable {
  final bool? isLoading;
  final String? errorMessage;
  final List<dynamic>? addressSuggestions;

  const AdressRecommendationState({
    this.isLoading = false,
    this.errorMessage = '',
    this.addressSuggestions = const []
 });


  AdressRecommendationState copyWith({
    List<dynamic>? addressSuggestions,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AdressRecommendationState(
      addressSuggestions: addressSuggestions ?? this.addressSuggestions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
  
  @override
  List<Object?> get props => [isLoading, errorMessage, addressSuggestions];
}

