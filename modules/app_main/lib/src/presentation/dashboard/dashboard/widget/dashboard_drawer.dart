import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';

enum _ScreenType {
  c,
  p,
  e;

  String get icon {
    if (this == _ScreenType.c) return IconAppConstants.icC;
    if (this == _ScreenType.p) return IconAppConstants.icP;
    return IconAppConstants.icE;
  }

  String get title {
    if (this == _ScreenType.c) return 'Màn C';
    if (this == _ScreenType.p) return 'Màn P';
    return 'Màn E';
  }
}

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  _ScreenType _type = _ScreenType.c;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaY: 10,
          sigmaX: 10,
        ),
        child: Drawer(
          backgroundColor: const Color.fromRGBO(18, 18, 18, 0.70),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: CloseButton(color: Colors.white),
                    ),
                    const Text(
                      'Màn hình mặc định',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._ScreenType.values
                        .map<Widget>(
                          (e) => Row(
                            children: [
                              Radio(
                                activeColor: Colors.white,
                                value: _type,
                                groupValue: e,
                                onChanged: (_) {
                                  setState(() {
                                    _type = e;
                                  });
                                },
                              ),
                              const SizedBox(width: 6),
                              SizedBox.square(
                                dimension: 40,
                                child: ImageWidget(e.icon),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                e.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList()
                        .separated(const SizedBox(height: 8)),
                    const SizedBox(height: 16),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xff646464),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
