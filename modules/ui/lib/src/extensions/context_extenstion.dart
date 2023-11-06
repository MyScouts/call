import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension BuildContextTool on BuildContext {
  Future<void> openUrl(String link, {bool isFileLocal = false}) async {
    late LaunchMode mode;
    late Uri uri;

    if (isFileLocal) {
      mode = LaunchMode.platformDefault;
      uri = Uri.file(link);
    } else {
      mode = LaunchMode.externalApplication;
      uri = Uri.parse(link);
    }

    if (!await launchUrl(uri, mode: mode)) {}
  }
}
