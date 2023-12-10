import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class ReactIntereactWidget extends StatefulWidget {
  const ReactIntereactWidget({
    required this.iconName,
    this.text = '',
    this.size = 16.0,
    this.onChange,
    this.isShowActiveImageWhenTapped = false,
    this.iconActivedName,
    this.parentHeight,
    this.isHearted = false,
    this.isDarkMode = false,
    super.key,
  });

  final double size;
  final String text;
  final Function(bool)? onChange;
  final bool isShowActiveImageWhenTapped;
  final bool isHearted;

  final String iconName;
  final String? iconActivedName;
  final double? parentHeight;
  final bool isDarkMode;

  @override
  State<ReactIntereactWidget> createState() => _ReactIntereactWidgetState();
}

class _ReactIntereactWidgetState extends State<ReactIntereactWidget> {
  late bool isHearted;

  @override
  void initState() {
    super.initState();
    isHearted = widget.isHearted;
  }

  @override
  Widget build(BuildContext context) {
    final String icon = widget.isShowActiveImageWhenTapped
        ? (isHearted ? widget.iconActivedName! : widget.iconName)
        : widget.iconName;

    return InkWell(
      onTap: () {
        if (widget.isShowActiveImageWhenTapped) {
          setState(() {
            isHearted = !isHearted;
            if (widget.onChange != null) {
              widget.onChange!(isHearted);
            }
          });
        }
      },
      child: Container(
        height: widget.parentHeight,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              icon,
              width: 16,
              height: 16,
              color: widget.isDarkMode
                  ? (isHearted ? AppColors.red70 : AppColors.grey77)
                  : null,
            ),
            if (widget.text.isNotEmpty) const SizedBox(width: 10),
            if (widget.text.isNotEmpty)
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isHearted
                      ? AppColors.red70
                      : (widget.isDarkMode
                          ? AppColors.grey77
                          : AppColors.grey76),
                ),
              )
          ],
        ),
      ),
    );
  }
}
