import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import 'widgets/policy_content.dart';
import 'widgets/text_static_content_widget.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final List<Map<String, String>> data;
  static const String routeName = '/terms-conditions';

  const TermsAndConditionsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điều khoản chính sách'),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: AutoHideKeyboard(
        child: TextStaticContentWidget(contents: data),
      ),
    );
  }
}
