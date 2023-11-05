import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldHideKeyboard(
      body: SafeArea(
          child: GestureDetector(
        onTap: () => context.startDiary(userId: "301"),
        child: Container(child: Text("User")),
      )),
    );
  }
}
