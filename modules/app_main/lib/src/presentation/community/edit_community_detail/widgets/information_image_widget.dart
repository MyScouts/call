import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class InformationImageWidget extends StatelessWidget {
  const InformationImageWidget({
    super.key,
    required this.label,
    required this.onTapEdit,
    required this.child,
  });

  final String label;
  final VoidCallback onTapEdit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InformationLayoutFieldWidget(
      label: label,
      required: false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.grey10),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onTapEdit,
                child: Container(
                  color: Colors.transparent,
                  width: 50,
                  height: 40,
                  padding: const EdgeInsets.only(top: 14, right: 14),
                  child: Text(
                    'Sửa',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.blue10),
                  ),
                ),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
