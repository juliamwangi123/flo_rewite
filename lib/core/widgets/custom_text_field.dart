import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  /// A wrapper for [TextFormField] that contains options for a field label.
  ///
  /// For the label to appear the [fieldLabel] must be specified.
  /// If [fieldLabel] is specified and [isRequired] is true, then a red asterisk
  /// is added to the label.
  ///
  /// For a documentation about the various parameters, see [TextFormField].
  const CustomTextField({
    super.key,
    bool? enabled,
    bool? obscureText,
    this.formFieldKey,
    this.focusNode,
    this.fieldLabel,
    this.controller,
    this.onChanged,
    this.hintText,
    this.hintColor,
    this.customFillColor,
    this.maxLines = 1,
    this.minLines,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.isRequired,
    this.labelStyle,
    this.focusedBorderColor,
    this.initialValue,
    this.onTap,
    this.readOnly,
    this.borderRadius,
    this.contentPadding,
  })  : enabled = enabled ?? true,
        obscureText = obscureText ?? false;

  final Color? borderColor;
  final Key? formFieldKey;
  final TextEditingController? controller;
  final Color? customFillColor;
  final bool enabled;
  final String? fieldLabel;
  final FocusNode? focusNode;
  final Color? hintColor;
  final String? hintText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isRequired;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextStyle? labelStyle;
  final Color? focusedBorderColor;
  final void Function()? onTap;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;

  bool alignLabelWithHint(int? maxLines) => maxLines != null && maxLines > 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels = <Widget>[];
    if (fieldLabel != null) {
      labels.addAll(
        <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: TextFormHintText(
              hintText: fieldLabel!,
              isRequired: isRequired,
            ),
          ),
          SizedBox(height: 8.0),
        ],
      );
    }

    return Column(
      children: <Widget>[
        ...labels,
        TextFormField(
          maxLength: maxLength,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          key: formFieldKey,
          initialValue: initialValue,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: readOnly ?? false,
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                (!enabled) ? Colors.grey[600] : customFillColor ?? Colors.white,
            alignLabelWithHint: alignLabelWithHint(maxLines),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor ?? Colors.grey),
            suffixIcon: suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 24, minWidth: 24),
            prefixIcon: prefixIcon,
            labelStyle: labelStyle ?? TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? customFillColor ?? Colors.white24,
              ),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            focusColor: Theme.of(context).colorScheme.secondary,
          ),
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}

class TextFormHintText extends StatelessWidget {
  const TextFormHintText({
    super.key,
    required this.hintText,
    bool? isRequired,
  }) : isRequired = isRequired ?? false;

  final String hintText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return Row(
        children: <Widget>[
          HintText(hintText: hintText),
          const Flexible(
            child: Text('*',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          )
        ],
      );
    }

    return HintText(hintText: hintText);
  }
}

class HintText extends StatelessWidget {
  const HintText({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
