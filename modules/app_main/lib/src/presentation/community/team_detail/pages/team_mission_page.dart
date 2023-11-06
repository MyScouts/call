import 'package:flutter/material.dart';

class TeamMissionPage extends StatefulWidget {
  const TeamMissionPage({super.key});

  @override
  State<TeamMissionPage> createState() => _TeamMissionPageState();
}

class _TeamMissionPageState extends State<TeamMissionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Tính năng đăng phát triển'),
      ),
    );
  }
}
