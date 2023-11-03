import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';
import 'package:ui/ui.dart';

class AppStoreWidget extends StatefulWidget {
  final List<AppItem> initApp;
  final Function(List<AppItem>) onCompleted;
  const AppStoreWidget({
    super.key,
    required this.initApp,
    required this.onCompleted,
  });

  @override
  State<AppStoreWidget> createState() => _AppStoreWidgetState();
}

class _AppStoreWidgetState extends State<AppStoreWidget> {
  late List<AppItem> results;
  late List<AppItem> apps;
  @override
  void initState() {
    super.initState();
    results = widget.initApp;
    apps = AppItem.personalStore;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final app = AppItem.personalStore[index];
                final foundApp =
                    results.lastWhereOrNull((element) => app.id == element.id);
                return Stack(
                  children: [
                    Column(children: [
                      Expanded(child: ImageWidget(app.avatar)),
                      Text(
                        app.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodySmall,
                      ),
                    ]),
                    if (foundApp == null)
                      Positioned(
                        right: 3,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            results.add(app);
                            setState(() {});
                          },
                          child: const Icon(Icons.add_circle),
                        ),
                      ),
                    if (foundApp != null)
                      Positioned(
                        right: 3,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            results
                                .removeWhere((element) => element.id == app.id);
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.remove_circle_outline,
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
          PrimaryButton(
            title: S.current.confirm,
            disabled: false,
            onTap: () {
              widget.onCompleted(results);
              Navigator.pop(context, results);
            },
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
