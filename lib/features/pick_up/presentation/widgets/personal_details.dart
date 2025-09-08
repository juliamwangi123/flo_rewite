import 'package:country_code_picker/country_code_picker.dart';
import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/bloc/schedule_pickup_bloc.dart';
import 'package:floo_aid_rewrite/features/pick_up/presentation/widgets/multi_form_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetails extends StatelessWidget {
  final List<String> donationTypes;

  const PersonalDetails({super.key, required this.donationTypes});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MultiFormSkeleton(
          title: 'Personal Details',
          children: [
            mediumVerticalSizedBox,
            PersonalDetailsItemWidget(
              initialValue:
                  state.currentForm.fullName
                      .split(RegExp(r'\s+'))
                      .join(' ')
                      .trim(),
              label: 'Full Name',
              hintText: 'Enter your full name',
              icon: Icons.person_outline,
              onchanged: (value) {
                context.read<SchedulePickupBloc>().add(
                  UpdateFormFieldEvent(field: 'fullName', value: value),
                );
              },
            ),
            mediumVerticalSizedBox,
            PersonalDetailsItemWidget(
              initialValue: state.currentForm.phoneNumber,
              label: 'Phone Number',
              hintText: '0712 345 678',
              icon: Icons.phone_outlined,
              isPhoneNumber: true,
              onchanged: (value) {
                context.read<SchedulePickupBloc>().add(
                  UpdateFormFieldEvent(
                    field: 'phoneNumber',
                    value:
                        '(${state.currentForm.countryCode?.dialCode ?? 'KE'}) $value',
                  ),
                );
              },
            ),
            mediumVerticalSizedBox,
            DonationType(
              donationTypes: donationTypes,
              userSelectedType:
                  (state.currentForm.donationType.isEmpty)
                      ? donationTypes[0]
                      : state.currentForm.donationType,
            ),
          ],
        );
      },
    );
  }
}

class PersonalDetailsItemWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;
  final int? maxLines;
  final Function(dynamic)? onchanged;
  final String? initialValue;
  final bool isPhoneNumber;
  final int? countryCode;

  const PersonalDetailsItemWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    this.maxLines = 1,
    this.onchanged,
    this.initialValue,
    this.isPhoneNumber = false,
    this.countryCode,
  });

  bool isValidPhoneNumber(String phone) {
    final cleanPhone = phone.replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final RegExp phoneRegExp = RegExp(r'^\+?([0-9]{1,3})?[-. ]?([0-9]{6,12})$');

    if (!phoneRegExp.hasMatch(cleanPhone)) {
      return false;
    }

    if (cleanPhone.length < 8 || cleanPhone.length > 15) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.floaidPurple, size: 18, weight: 100),
              verySmallHorizontalSizedBox,
            ],
            Text('$label *', style: boldSize15Text(AppColors.deepNavy)),
          ],
        ),
        smallVerticalSizedBox,
        if (isPhoneNumber)
          Container(
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.lightGray.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CountryCodePicker(
                      onChanged: (CountryCode countryCode) {
                        context.read<SchedulePickupBloc>().add(
                          UpdateFormFieldEvent(
                            field: 'countryCode',
                            value: CountryCode(
                              code: countryCode.code ?? 'KE',
                              dialCode: countryCode.dialCode ?? '+254',
                              name: countryCode.name ?? 'Kenya',
                            ),
                          ),
                        );
                      },
                      initialSelection:
                          (state.currentForm.countryCode?.dialCode?.isEmpty ??
                                  true)
                              ? 'KE'
                              : state.currentForm.countryCode?.dialCode,
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    );
                  },
                ),
                Expanded(
                  child: CustomTextField(
                    initialValue: initialValue,
                    keyboardType: TextInputType.phone,
                    hintText: hintText,
                    isRequired: true,
                    borderColor: Colors.transparent,
                    focusedBorderColor: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 13,
                    ),
                    maxLines: maxLines,
                    onChanged: onchanged,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!isValidPhoneNumber(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          )
        else
          CustomTextField(
            initialValue: initialValue,
            keyboardType: TextInputType.text,
            hintText: hintText,
            isRequired: true,
            borderColor: AppColors.lightGray.withValues(alpha: 0.3),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
            maxLines: maxLines,
            onChanged: onchanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
          ),
      ],
    );
  }
}

class DonationTypeSelectorItem extends StatelessWidget {
  final String buttonLabel;
  final bool isActive;
  final Color backgroundColor;
  final void Function() onTap;

  const DonationTypeSelectorItem({
    super.key,
    required this.buttonLabel,
    required this.isActive,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.sizeOf(context).width * 0.36,
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : AppColors.lightBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isActive
                    ? AppColors.floaidPurple.withValues(alpha: 0.6)
                    : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: boldSize13Text(
              isActive ? AppColors.floaidPurple : AppColors.deepNavy,
            ),
          ),
        ),
      ),
    );
  }
}

class DonationType extends StatefulWidget {
  final List<String> donationTypes;
  final String userSelectedType;

  const DonationType({
    super.key,
    required this.donationTypes,
    required this.userSelectedType,
  });

  @override
  State<DonationType> createState() => _DonationTypeState();
}

class _DonationTypeState extends State<DonationType> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchedulePickupBloc, SchedulePickupState>(
      listener: (context, state) {},
      builder: (context, state) {
        late String selectedType;
        selectedType = widget.userSelectedType;
        if (state.currentForm.donationType.isEmpty) {
          context.read<SchedulePickupBloc>().add(
            UpdateFormFieldEvent(
              field: 'donationType',
              value: widget.donationTypes[0],
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verySmallHorizontalSizedBox,
            Text('Donation Type *', style: boldSize15Text(AppColors.deepNavy)),
            smallVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DonationTypeSelectorItem(
                  buttonLabel: 'Individual',
                  isActive: selectedType == widget.donationTypes[0],
                  backgroundColor: AppColors.lavendarColor.withValues(
                    alpha: 0.3,
                  ),
                  onTap: () {
                    setState(() {
                      selectedType = widget.donationTypes[0];
                    });
                    context.read<SchedulePickupBloc>().add(
                      UpdateFormFieldEvent(
                        field: 'donationType',
                        value: widget.donationTypes[0],
                      ),
                    );
                  },
                ),
                DonationTypeSelectorItem(
                  buttonLabel: 'Organization',
                  isActive: selectedType == widget.donationTypes[1],
                  backgroundColor: AppColors.lavendarColor.withValues(
                    alpha: 0.3,
                  ),
                  onTap: () {
                    setState(() {
                      selectedType = widget.donationTypes[1];
                    });
                    context.read<SchedulePickupBloc>().add(
                      UpdateFormFieldEvent(
                        field: 'donationType',
                        value: widget.donationTypes[1],
                      ),
                    );
                  },
                ),
              ],
            ),
            mediumVerticalSizedBox,
          ],
        );
      },
    );
  }
}
