import 'package:flutter/material.dart';

import '../../domain/entities/gift_card_list.dart';
import 'gift_item.dart';

class GiftPage extends StatefulWidget {
  final List<GiftCard> gifts;
  final ValueNotifier<GiftCard?> selectedGift;
  final ValueChanged<GiftCard> onChanged;

  const GiftPage({super.key, required this.gifts, required this.selectedGift, required this.onChanged});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  int pageLength = 1;

  @override
  void initState() {
    pageLength = widget.gifts.length > 8 ? (widget.gifts.length ~/ 8 + (widget.gifts.length % 8 > 0 ? 1 : 0)) : 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: pageLength,
        itemBuilder: (_, pageIndex) {
          final count = getPageCount(pageLength, pageIndex);
          return ValueListenableBuilder(
            valueListenable: widget.selectedGift,
            builder: (BuildContext context, GiftCard? value, Widget? child) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: count,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (_, index) {
                  final itemIndex = pageIndex * 8 + index;
                  return GiftItem(
                    isSelected: widget.gifts[itemIndex].id == value?.id,
                    gift: widget.gifts[itemIndex],
                    onTap: () {
                      widget.selectedGift.value = widget.gifts[itemIndex];
                      widget.onChanged.call(widget.gifts[itemIndex]);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  int getPageCount(int pageLength, int pageIndex) {
    if (pageLength == 1) {
      return widget.gifts.length;
    } else {
      if (pageIndex == pageLength - 1) {
        return widget.gifts.length % 8;
      } else if (pageIndex < pageLength - 1) {
        return 8;
      } else {
        return 0;
      }
    }
  }
}
