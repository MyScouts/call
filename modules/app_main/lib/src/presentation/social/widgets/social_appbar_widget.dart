import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SocialAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const SocialAppBarWidget({this.titleText, this.title, super.key});
  final String? titleText;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleText != null
          ? Text(
              titleText!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          : title,
      centerTitle: true,
      elevation: 0,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
