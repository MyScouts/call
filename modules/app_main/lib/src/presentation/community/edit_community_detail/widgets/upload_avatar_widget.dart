import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UploadAvatarWidget extends StatelessWidget {
  final String? urlImg;
  final bool hasError;

  const UploadAvatarWidget({
    super.key,
    this.urlImg,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (urlImg != null && !urlImg!.contains('https'))
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: CircularProgressIndicator(),
          ),
        AvatarWidget(size: 148, avatar: urlImg),
        if (hasError)
          const Positioned(
            top: 0,
            right: 0,
            child: Row(
              children: [
                Icon(Icons.error_rounded, color: Colors.red),
                Text(
                  'Fail',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
      ],
    );
  }
}
