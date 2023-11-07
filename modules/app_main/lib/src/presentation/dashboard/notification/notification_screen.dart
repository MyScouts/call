import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:imagewidget/imagewidget.dart';

import 'notification_card.dart';

class NotificationScreen extends StatefulWidget {
  static const String routerName = '/notification';

  const NotificationScreen({super.key, required this.onClose});

  final Function() onClose;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(.3),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        BackButton(
                          color: Colors.white,
                          onPressed: widget.onClose,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Trung tâm thông báo',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      cursorHeight: 20,
                      cursorColor: Colors.white,
                      style:  const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        contentPadding: EdgeInsets.zero,
                        fillColor: const Color.fromRGBO(242, 242, 242, 0.24),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 16),
                            ImageWidget(
                              IconAppConstants.icSearch,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const NotificationMock(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
