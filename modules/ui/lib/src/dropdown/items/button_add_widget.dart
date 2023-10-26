import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ButtonAddWidget extends StatelessWidget {
  const ButtonAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: AppColors.blue10,
      ),
      child: const Center(
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
