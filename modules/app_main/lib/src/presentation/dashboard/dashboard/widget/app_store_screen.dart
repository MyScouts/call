import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/dashboard/dashboard/widget/app_widget.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AppStoreScreen extends StatefulWidget {
  const AppStoreScreen({super.key, required this.onClose});
  final Function() onClose;

  @override
  State<AppStoreScreen> createState() => _AppStoreScreenState();
}

class _AppStoreScreenState extends State<AppStoreScreen> {
  bool enableEditMode = false;

  final List<DashBoardItem> _items =
      mapData.values.where((e) => !e.id.contains('wg')).toList();

  List<DashBoardItem> _favorites = [];

  @override
  void initState() {
    _favorites = getIt<DashboardSharePreferenceUseCase>().getDashBoardFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClose,
      behavior: HitTestBehavior.opaque,
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaY: 10,
            sigmaX: 10,
          ),
          child: Scaffold(
            backgroundColor: Colors.black.withOpacity(0.5),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        enableEditMode = true;
                      });

                    },
                    onTap: () {
                      setState(() {
                        enableEditMode = false;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(
                            sigmaX: 15,
                            sigmaY: 15,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(220, 220, 220, 0.50),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Thư viện ứng dụng',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 21),
                                Row(
                                  children: [
                                    const Text(
                                      'Ứng dụng ưa thích',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        if (enableEditMode) {
                                          getIt<DashboardSharePreferenceUseCase>()
                                              .saveDashboardItemsFav(_favorites);
                                        }
                                        setState(() {
                                          enableEditMode = !enableEditMode;
                                        });
                                      },
                                      behavior: HitTestBehavior.opaque,
                                      child: Text(
                                        enableEditMode ? 'Lưu lại' : 'Sửa',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GridView.count(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shrinkWrap: true,
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 20,
                                  children: _favorites
                                      .map(
                                        (e) => AppStoreWidgetBuilder(
                                      app: e,
                                      enableEditMode: enableEditMode,
                                      onRemoved: () {
                                        setState(() {
                                          _favorites.remove(e);
                                          _items.add(e);
                                        });
                                      },
                                    ),
                                  )
                                      .toList(),
                                ),
                                const Text(
                                  'Kho ứng dụng',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 21),
                                GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 20,
                                  children: _items
                                      .map(
                                        (e) => AppStoreWidgetBuilder(
                                      app: e,
                                      enableEditMode: enableEditMode,
                                      onRemoved: () {},
                                      onAdd: () {
                                        setState(() {
                                          _items.remove(e);
                                          _favorites.add(e);
                                        });
                                      },
                                    ),
                                  )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
