import 'dart:async';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/address_recommendation_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickUpLocationDetails extends StatefulWidget {
  const PickUpLocationDetails({super.key});

  @override
  State<PickUpLocationDetails> createState() => _PickUpLocationDetailsState();
}

class _PickUpLocationDetailsState extends State<PickUpLocationDetails> {
  bool _showSuggestions = false;
  List<dynamic> _localSuggestions = [];
  String _currentValue = '';
  Timer? _debounce;
  Key _addressFieldKey = UniqueKey();

  void _onChanged(BuildContext context, String value) {
    _currentValue = value;

    context.read<SchedulePickupBloc>().add(
      UpdateFormFieldEvent(field: 'address', value: value),
    );

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (value.length == 3) {
        context.read<AdressRecommendationBloc>().add(
          FetchAddressSuggestionsEvent(value),
        );
        setState(() => _showSuggestions = true);
      } else if (value.length > 3) {
        setState(() => _showSuggestions = true);
      } else {
        setState(() => _showSuggestions = false);
      }
    });
  }

  void _selectSuggestion(BuildContext context, String suggestion) {
    context.read<SchedulePickupBloc>().add(
      UpdateFormFieldEvent(field: 'address', value: suggestion),
    );
    
    setState(() {
      _currentValue = suggestion; 
      _showSuggestions = false;
      _addressFieldKey = UniqueKey();
    });
  }

  void _closeSuggestions() {
    if (_showSuggestions) {
      setState(() => _showSuggestions = false);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus(); 
        _closeSuggestions(); 
      },
      child: BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
        listener: (context, state) {},
        builder: (context, scheduleState) {
          return MultiFormSkeleton(
            title: 'Pickup Location',
            children: [
              mediumVerticalSizedBox,
              BlocBuilder<AdressRecommendationBloc, AdressRecommendationState>(
                builder: (context, recState) {
                  if (recState.addressSuggestions != null &&
                      recState.addressSuggestions!.isNotEmpty) {
                    _localSuggestions = recState.addressSuggestions!;
                  }

                  final filtered = (_currentValue.length >= 3)
                      ? _localSuggestions
                          .where((s) => s
                              .toString()
                              .toLowerCase()
                              .contains(_currentValue.toLowerCase()))
                          .take(5)
                          .toList()
                      : [];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) _closeSuggestions();
                        },
                        child: PersonalDetailsItemWidget(
                          key: _addressFieldKey, 
                          initialValue: _currentValue.isNotEmpty
                              ? _currentValue
                              : scheduleState.currentForm.address,
                          label: 'Address',
                          hintText: 'Complete pickup address',
                          icon: Icons.location_on_outlined,
                          maxLines: 2,
                          onchanged: (value) => _onChanged(context, value),
                        ),
                      ),
                      if (_showSuggestions && filtered.isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          constraints: const BoxConstraints(maxHeight: 180),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(color: AppColors.veryLightGray),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: AppColors.blackColor.withValues(alpha: .1),
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                              final suggestion = filtered[index].toString();
                              return ListTile(
                                dense: true,
                                title: Text(suggestion),
                                onTap: () => _selectSuggestion(context, suggestion),
                              );
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
              smallVerticalSizedBox,
              PersonalDetailsItemWidget(
                initialValue: scheduleState.currentForm.landmark,
                label: 'Landmark/Building',
                hintText: 'Building name , nearby shop etc',
                onchanged: (value) {
                  context.read<SchedulePickupBloc>().add(
                    UpdateFormFieldEvent(field: 'landmark', value: value),
                  );
                  _closeSuggestions();
                },
              ),
              smallVerticalSizedBox,
              PersonalDetailsItemWidget(
                initialValue: scheduleState.currentForm.accessInstructions ?? '',
                isRequired: false,
                label: 'Access Instructions',
                hintText: 'Gate code, security info, best time to call..',
                maxLines: 3,
                onchanged: (value) {
                  context.read<SchedulePickupBloc>().add(
                    UpdateFormFieldEvent(
                        field: 'accessInstructions', value: value)
                  );
                  _closeSuggestions();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}