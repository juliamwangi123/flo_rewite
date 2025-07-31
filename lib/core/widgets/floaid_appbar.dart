
import 'package:flutter/material.dart';

class FloAidAppBar extends StatelessWidget {
  final IconData? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingWidget;
  final VoidCallback? onLeadingPressed;

  const FloAidAppBar({
    super.key,
    this.leadingWidget,
    this.titleWidget,
    this.trailingWidget,
    this.onLeadingPressed
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
              icon: Icon(leadingWidget),
              onPressed: onLeadingPressed 
            ),
          titleWidget ?? const SizedBox.shrink(),
          trailingWidget ?? const SizedBox.shrink(),

        ],
      ),
    );
  }
}