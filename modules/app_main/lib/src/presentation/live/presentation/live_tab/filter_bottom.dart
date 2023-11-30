import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/live_category_detail.dart';
import 'live_controller.dart';

class FilterBottom extends StatefulWidget {
  final LiveController controller;

  const FilterBottom({super.key, required this.controller});

  @override
  State<FilterBottom> createState() => _FilterBottomState();
}

class _FilterBottomState extends State<FilterBottom> {
  bool isSelect(LiveCategoryDetail liveCategoryDetail) {
    return listCategorySelect.value?.id == liveCategoryDetail.id;
  }

  @override
  void initState() {
    listCategorySelect.value = widget.controller.listCategorySelect.value;
    super.initState();
  }

  final Rxn<LiveCategoryDetail> listCategorySelect = Rxn<LiveCategoryDetail>();

  final isSelectAll = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close)),
                  const Text(
                    'Lọc phòng live',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 32,
              thickness: 1,
              color: Color(0xffEAEDF0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Chủ đề",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                return Wrap(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     isSelectAll.value = !isSelectAll.value;
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(16),
                    //         border: Border.all(
                    //             color: isSelectAll.value ? const Color(0xff4B84F7) : const Color(0xffD0D6DD))),
                    //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    //     child: Text(
                    //       'Tất cả',
                    //       style: TextStyle(
                    //           color: isSelectAll.value ? const Color(0xff4B84F7) : Colors.black,
                    //           fontWeight: isSelectAll.value ? FontWeight.w600 : FontWeight.w400),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(width: 8),
                    ...widget.controller.listCategory
                        .map((element) => SizedBox(
                              child: GestureDetector(
                                onTap: () {
                                  if (isSelect(element)) {
                                    listCategorySelect.value = null;
                                  } else {
                                    listCategorySelect.value = element;
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color:
                                              isSelect(element) ? const Color(0xff4B84F7) : const Color(0xffD0D6DD))),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Text(
                                    element.name ?? '',
                                    style: TextStyle(
                                        color: isSelect(element) ? const Color(0xff4B84F7) : Colors.black,
                                        fontWeight: isSelect(element) ? FontWeight.w600 : FontWeight.w400),
                                  ),
                                ),
                              ),
                            ))
                        .toList()
                        .separated(const SizedBox(width: 8))
                  ],
                );
              }),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffE8F0FE), foregroundColor: Colors.blue),
                          onPressed: () {
                            listCategorySelect.value = widget.controller.listCategorySelect.value;
                          },
                          child: const Text("Thiết lập lại"))),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4B84F7),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            widget.controller.listCategorySelect.value = listCategorySelect.value;
                            Navigator.pop(context, listCategorySelect.value);
                          },
                          child: const Text("Áp dụng"))),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
