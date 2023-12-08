//import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class ViewImagePage extends StatelessWidget {
  static const routeName = 'ViewImagePage';
  final String urlImage;
  const ViewImagePage({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        isClose: false,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: urlImage,
          progressIndicatorBuilder: (_, __, ___) => const LoadingWidget(),
          errorWidget: (_, __, ___) => const Center(
            child: Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
