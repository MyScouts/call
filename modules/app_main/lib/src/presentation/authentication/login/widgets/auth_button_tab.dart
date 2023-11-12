import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class LoginButtonTab extends StatelessWidget {
  final int page;
  final Function(int) onChange;
  const LoginButtonTab({
    super.key,
    required this.page,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onChange(0),
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        S.current.login,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 20 / 14,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Color(0xFF6E6E6E),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () => onChange(1),
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        S.current.register,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 20 / 14,
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Color(0xFF6E6E6E),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        AnimatedAlign(
          alignment: Alignment(page == 0 ? -1.0 : 1.0, 0),
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: 150,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: Center(
                child: Text(
                  page == 0 ? S.current.login : S.current.register,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 20 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                    color: Color(0xFF6E6E6E),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
