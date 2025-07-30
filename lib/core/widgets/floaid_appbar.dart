import 'package:flutter/material.dart';

class FloAidAppBar extends StatelessWidget {
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingWidget;

  const FloAidAppBar({
    super.key,
    this.leadingWidget,
    this.titleWidget,
    this.trailingWidget,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingWidget ?? const SizedBox.shrink(),
          titleWidget ?? const SizedBox.shrink(),
          trailingWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}