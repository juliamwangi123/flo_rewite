import 'package:floo_aid_rewrite/core/theme/text_theme.dart';
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class FloAidCustomDropDownMenu<T> extends StatefulWidget {
  final List<T> items;
  final T? dropDownValue;
  final String? hintText;
  final String Function(T)? itemLabel;
  final ValueChanged<T>? onChanged;

  const FloAidCustomDropDownMenu({
    super.key,
    required this.items,
    this.dropDownValue,
    this.hintText,
    this.itemLabel,
    this.onChanged,
  });

  @override
  State<FloAidCustomDropDownMenu<T>> createState() => _FloAidCustomDropDownState<T>();
}

class _FloAidCustomDropDownState<T> extends State<FloAidCustomDropDownMenu<T>> {
   T? dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.dropDownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       padding : const EdgeInsets.symmetric(
            // horizontal: 10,
            // vertical: 13,
          ),
          decoration: BoxDecoration(
            border: Border.all(
             color:  AppColors.lightGray.withValues(alpha: 0.3),

            ),
            borderRadius: BorderRadius.circular(10),
          ),
      child: DropdownButton<T>(
        isExpanded: true,
        focusColor: AppColors.empowermentTeal,
        underline: const SizedBox(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), 
        alignment: Alignment.centerLeft,
        value: dropdownValue,
        dropdownColor: AppColors.whiteColor,
        icon: const Icon(Icons.expand_more, ),
        elevation: 16,
        style: normalSize16Text(AppColors.deepNavy),
        hint: widget.hintText != null ? Text(widget.hintText!, style: normalSize15Text(AppColors.hintTextColor),) : null,
        onChanged: (T? value) {
          if (value != null) {
            setState(() {
              dropdownValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          }
        },
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(widget.itemLabel != null ? widget.itemLabel!(value) : value.toString()),
          );
        }).toList(),
      ),
    );
  }
}