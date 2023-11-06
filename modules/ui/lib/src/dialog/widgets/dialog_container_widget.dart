import 'package:flutter/material.dart';

class DialogContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? marginContent;
  final EdgeInsets? paddingContent;
  final BorderRadius? borderRadius;
  const DialogContainerWidget({
    super.key,
    required this.child,
    this.marginContent,
    this.paddingContent,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        margin: marginContent ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF696969)),
          borderRadius: borderRadius ?? BorderRadiusDirectional.circular(16),
          color: Colors.white,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: paddingContent ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
