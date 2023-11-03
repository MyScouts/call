import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DashBoardGroupScreen extends StatefulWidget {
  const DashBoardGroupScreen({
    super.key,
    required this.item,
    required this.moveItem,
  });

  final DashBoardItem item;
  final DashBoardItem moveItem;

  @override
  State<DashBoardGroupScreen> createState() => _DashBoardGroupScreenState();
}

class _DashBoardGroupScreenState extends State<DashBoardGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black.withOpacity(.5),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 16.0,
                  sigmaY: 16.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(17, 17, 17, 0.40),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: [
                      AppWidget(app: widget.item),
                      AppWidget(app: widget.moveItem),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
