import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HTMLLoadMoreViewer extends StatefulWidget {
  final String html;
  const HTMLLoadMoreViewer({
    super.key,
    required this.html,
  });

  @override
  State<HTMLLoadMoreViewer> createState() => _HTMLLoadMoreViewerState();
}

class _HTMLLoadMoreViewerState extends State<HTMLLoadMoreViewer> {
  bool _isCollapse = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          constraints: _isCollapse
              ? BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .5,
                )
              : null,
          child: Html(
            data: widget.html,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            _isCollapse = !_isCollapse;
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: _isCollapse ? -45 : 45,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: context.theme.primaryColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  _isCollapse ? "Xem thêm" : "Thu gọn",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
