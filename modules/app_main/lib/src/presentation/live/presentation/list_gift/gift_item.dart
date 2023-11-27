import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../domain/entities/gift_card_list.dart';


class GiftItem extends StatelessWidget {
  const GiftItem({
    super.key,
    required this.isSelected,
    required this.gift,
    required this.onTap,
  });

  final bool isSelected;
  final GiftCard gift;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFBF4FF) : null,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? const Color(0xff9627DF) : Colors.transparent,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageWidget(
              gift.imageGift ?? '',
              aspectRatio: 1,
              width: 50,
              height: 50,
              fit: BoxFit.fill,
            ),
            Text(
              gift.name ?? '',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(
                  IconAppConstants.icCoin,
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  '${gift.coinValue ?? 0}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
