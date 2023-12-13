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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
