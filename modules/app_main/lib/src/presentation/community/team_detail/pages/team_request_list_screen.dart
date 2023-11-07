import 'package:flutter/material.dart';

class TeamRequestListScreen extends StatefulWidget {
  static const String routeName = '/team-requests';

  const TeamRequestListScreen({super.key});

  @override
  State<TeamRequestListScreen> createState() => _TeamRequestListScreenState();
}

class _TeamRequestListScreenState extends State<TeamRequestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Yêu cầu cần phê duyệt',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
