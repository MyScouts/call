import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class UpgradeMarshopScreen extends StatefulWidget {
  static const String routeName = "upgrade-marshop";
  const UpgradeMarshopScreen({super.key});

  @override
  State<UpgradeMarshopScreen> createState() => _UpgradeMarshopScreenState();
}

class _UpgradeMarshopScreenState extends State<UpgradeMarshopScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      appBar: const BaseAppBar(title: "Đăng ký V-Shop"),
      body: Container(),
    );
  }
}
