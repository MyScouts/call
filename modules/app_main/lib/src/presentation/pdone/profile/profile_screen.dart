import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile";
  final String? userId;
  const ProfileScreen({
    super.key,
    required this.userId,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
