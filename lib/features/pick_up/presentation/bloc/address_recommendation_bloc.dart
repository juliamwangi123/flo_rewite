import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/pick_up/data/datasource/address_service.dart';

part 'address_recommendation_event.dart';
part 'address_recommendation_state.dart';

class AdressRecommendationBloc extends Bloc<AdressRecommendationEvent, AdressRecommendationState> {
  final AddressService addressService;
  
  AdressRecommendationBloc(this.addressService) : super(const AdressRecommendationState()) {
    on<FetchAddressSuggestionsEvent>(_onFetchAddressSuggestions);
  }

  Future<void> _onFetchAddressSuggestions(
    FetchAddressSuggestionsEvent event,
    Emitter<AdressRecommendationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, ));
    
    final result = await addressService.getAddressSuggestions(event.query);
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false, 
        errorMessage: (failure as ServerFailure).message,
      )), 
      (suggestions) => emit(state.copyWith(
        isLoading: false, 
        errorMessage: '', 
        addressSuggestions: suggestions
      ))
    );
  }
}