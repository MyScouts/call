import 'package:app_main/src/core/utils/loading_indicator/platform_loading.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/live/data/repository/live_repository.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_category_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

class LiveCategoryPicker extends StatefulWidget {
  const LiveCategoryPicker({
    super.key,
    required this.categories,
    required this.onChanged,
  });

  final List<LiveCategoryDetail> categories;
  final Function(List<LiveCategoryDetail>) onChanged;

  @override
  State<LiveCategoryPicker> createState() => _LiveCategoryPickerState();
}

class _LiveCategoryPickerState extends State<LiveCategoryPicker> {
  late final controller = getIt<CategoryController>();
  List<LiveCategoryDetail> _categories = [];

  @override
  void initState() {
    _categories = widget.categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 150),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppBar(
                leading: const CloseButton(),
                title: const Text(
                  'Chọn chủ đề livestream',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        widget.onChanged(_categories);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Xong',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: PlatformLoadingIndicator(size: 30),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: controller.category.map<Widget>((e) {
                    return GestureDetector(
                      onTap: () {
                        if(_categories.contains(e)) {
                          setState(() {
                            _categories.remove(e);
                          });
                        } else {
                          setState(() {
                            _categories.add(e);
                          });
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: _categories.contains(e)
                              ? Theme.of(context).primaryColor
                              : const Color(0xffF1F1F1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          e.name ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _categories.contains(e)
                                ? Colors.white
                                : const Color(0xffACACAC),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

@injectable
class CategoryController {
  final LiveRepository repository;

  CategoryController(this.repository) {
    _get();
  }

  final RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;

  List<LiveCategoryDetail> _category = [];

  List<LiveCategoryDetail> get category => _category;

  void _get() async {
    final res = await repository.listCategory();
    _category = res;
    _isLoading.value = false;
  }
}
