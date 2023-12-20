import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: isSelected ? const Color(0xffFFFFFF).withOpacity(0.2) : null,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImage(
              imageUrl: gift.imageGift ?? '',
              cacheKey: '${gift.imageGift ?? ''} 50',
              width: 50,
              height: 50,
              fit: BoxFit.fill,
              maxWidthDiskCache: ScreenUtil().screenWidth.toInt(),
            ),
            Text(
              gift.name ?? '',
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageWidget(IconAppConstants.icCoin1),
                const SizedBox(width: 4),
                Text(
                  '${gift.coinValue ?? 0}',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
