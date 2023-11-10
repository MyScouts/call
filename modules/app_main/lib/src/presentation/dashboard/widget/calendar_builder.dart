import 'package:flutter/material.dart';
class CalendarBuilder extends StatefulWidget {
  const CalendarBuilder({super.key, required this.builder});
  final Widget Function(DateTime now) builder;

  @override
  State<CalendarBuilder> createState() => _CalendarBuilderState();
}

class _CalendarBuilderState extends State<CalendarBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(DateTime.now());
  }
}
