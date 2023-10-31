import 'package:flutter/material.dart';

class DialogContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? marginContent;
  final EdgeInsets? paddingContent;
  const DialogContainerWidget({
    Key? key,
    required this.child,
    this.marginContent,
    this.paddingContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        margin: marginContent ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF696969)),
          borderRadius: BorderRadiusDirectional.circular(16),
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
