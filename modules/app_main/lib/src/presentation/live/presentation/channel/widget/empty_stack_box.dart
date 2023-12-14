import 'package:flutter/material.dart';

class EmptyStackBox extends StatelessWidget {
  const EmptyStackBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.center, child: SizedBox.shrink());
  }
}
