
import 'package:floo_aid_rewrite/core/theme/theme.dart';
import 'package:flutter/material.dart';

class FloAidAppBar extends StatelessWidget {
  final IconData? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingWidget;
  final VoidCallback? onLeadingPressed;
  final Color? leadingIconColor;

  const FloAidAppBar({
    super.key,
    this.leadingWidget,
    this.titleWidget,
    this.trailingWidget,
    this.onLeadingPressed,
    this.leadingIconColor
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(leadingWidget != null)
            IconButton(
              icon: Icon(leadingWidget,),
              onPressed: onLeadingPressed,
              color: leadingIconColor ?? AppColors.deepNavy,
            ),
          titleWidget ?? const SizedBox.shrink(),
          trailingWidget ?? const SizedBox.shrink(),

        ],
      ),
    );
  }
}