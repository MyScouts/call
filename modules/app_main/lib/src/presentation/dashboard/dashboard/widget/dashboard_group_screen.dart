import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DashBoardGroupScreen extends StatefulWidget {
  const DashBoardGroupScreen({
    super.key,
    required this.group,
    required this.moveItem,
    required this.onGroupCreated,
  });

  final DashBoardGroupItem group;
  final DashBoardItem moveItem;
  final Function(DashBoardGroupItem group) onGroupCreated;

  @override
  State<DashBoardGroupScreen> createState() => _DashBoardGroupScreenState();
}

class _DashBoardGroupScreenState extends State<DashBoardGroupScreen> {
  final FocusNode node = FocusNode();
  late final TextEditingController controller = TextEditingController(
    text: widget.group.title,
  );

  @override
  void dispose() {
    controller.dispose();
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 5.0,
          sigmaY: 5.0,
        ),
        child: GestureDetector(
          onTap: () {
            if (controller.text.trim().isEmpty) return;
            if (node.hasFocus) {
              node.unfocus();
              return;
            }
            widget.onGroupCreated.call(
              DashBoardGroupItem(
                id: widget.group.id,
                title: controller.text,
                backgroundImage: '',
                items: [
                  ...widget.group.items,
                  widget.moveItem as DashBoardIconItem
                ],
              ),
            );
            Navigator.of(context).pop();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(.5),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(),
                AnimatedBuilder(
                  animation: node,
                  builder: (_, __) {
                    return TextFormField(
                      controller: controller,
                      focusNode: node,
                      textAlign: TextAlign.center,
                      cursorHeight: 30,
                      cursorColor: Colors.white,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        fillColor: node.hasFocus
                            ? const Color.fromRGBO(17, 17, 17, 0.40)
                            : Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (node.hasFocus)
                              IconButton(
                                onPressed: controller.clear,
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                IgnorePointer(
                  ignoring: true,
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
                          child: Column(
                            children: [
                              Expanded(
                                child: GridView.count(
                                  padding: const EdgeInsets.all(16.0),
                                  crossAxisCount: 4,
                                  children: [
                                    ...widget.group.items.map(
                                      (e) => AppWidget(app: e),
                                    ),
                                    AppWidget(app: widget.moveItem),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
