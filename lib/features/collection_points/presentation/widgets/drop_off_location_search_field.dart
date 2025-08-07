import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:floo_aid_rewrite/core/widgets/custom_text_field.dart';
import 'package:floo_aid_rewrite/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

class DropOffLocationSearchInputField extends StatelessWidget {
  final VoidCallback? handlefilter;
  const DropOffLocationSearchInputField({
    super.key,
    required this.handlefilter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: CustomTextField(
            prefixIcon: Icon(Icons.search_outlined),
            borderColor: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            customFillColor: AppColors.offWhite,
            contentPadding: EdgeInsets.symmetric(vertical: 5),
          ),
        ),
        smallHorizontalSizedBox,
        Container(
          height: 48, 
          width: 40,
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(8), 
          ),
          child: IconButton(
            padding: EdgeInsets.zero, 
            icon: const Icon(Icons.filter_alt_outlined, size: 30, color: AppColors.deepNavy,),
            onPressed: handlefilter,
          ),
        ),
      ],
    );
  }
}