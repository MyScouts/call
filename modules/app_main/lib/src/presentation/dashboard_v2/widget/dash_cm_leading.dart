import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashBoardCommunityLeading extends StatelessWidget {
  const DashBoardCommunityLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _LiveHeader(),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _Image(path: ImageConstants.defaultUserAvatar),
                _Image(path: ImageConstants.defaultUserAvatar),
                _Image(path: ImageConstants.defaultUserAvatar),
                _Image(path: ImageConstants.defaultUserAvatar),
                _Image(path: ImageConstants.defaultUserAvatar),
              ].separated(const SizedBox(width: 6)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xffDE372D), width: 2),
      ),
      child: ClipOval(
        child: ImageWidget(path),
      ),
    );
  }
}

class _LiveHeader extends StatelessWidget {
  const _LiveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffDE372D),
          ),
        ),
        const SizedBox(width: 6),
        const Text(
          'Livestream đang diễn ra',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
