import 'package:app_main/src/presentation/live/domain/entities/live_detail.dart';
import 'package:app_main/src/presentation/live/presentation/list_gift/gift_bottom_sheet.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

class LiveWidget extends StatelessWidget {
  final LiveDetail liveDetail;

  const LiveWidget({super.key, required this.liveDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) => const GiftCardBottomSheet());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ImageWidget(
                  liveDetail.medias![0].link,
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00d9d9d9), Color(0xa5000000)],
                    ))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6.68, horizontal: 8),
                      decoration:
                          BoxDecoration(color: const Color(0xffF80E0E), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 6.63,
                            width: 6.63,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            S.of(context).live,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6.68, horizontal: 8),
                      decoration: BoxDecoration(
                          color: const Color(0xff000000).withOpacity(0.63), borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageWidget(
                            IconAppConstants.icUser3,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '870',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    liveDetail.title ?? '',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
