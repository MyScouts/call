//import 'dart:developer' as developer;
import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const TagWidget({super.key, required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.bgFa,
          borderRadius: BorderRadius.circular(isSelected ? 10 : 0),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Color.fromRGBO(118, 118, 118, 0.04),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Text(
              title,
              style: isSelected
                  ? context.textTheme.headlineSmall?.copyWith(color: AppColors.blueEdit)
                  : context.textTheme.bodyMedium?.copyWith(color: AppColors.gray500),
            ),
          ),
        ),
      ),
    );
  }
}
