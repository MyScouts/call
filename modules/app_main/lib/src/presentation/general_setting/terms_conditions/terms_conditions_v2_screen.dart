import 'package:flutter/material.dart';

class TeamAndCondictionV2Screen extends StatefulWidget {
  static const String routeName = 'team-condiction-v2';
  const TeamAndCondictionV2Screen({super.key});

  @override
  State<TeamAndCondictionV2Screen> createState() =>
      _TeamAndCondictionV2ScreenState();
}

class _TeamAndCondictionV2ScreenState extends State<TeamAndCondictionV2Screen> {
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
      body: Container(),
    );
  }
}
