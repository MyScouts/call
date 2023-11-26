import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/list_gift/gift_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:localization/localization.dart';

import '../../../../blocs/user/user_cubit.dart';
import '../../../../di/di.dart';
import '../../../community/widgets/circle_image.dart';
import '../../domain/entities/gift_card_list.dart';
import '../channel/state/live_channel_controller.dart';
import 'gift_page.dart';

class GiftCardBottomSheet extends StatefulWidget {
  static bool isShowBottom = false;
  final LiveChannelController controller;

  const GiftCardBottomSheet({super.key, required this.controller});

  @override
  State<GiftCardBottomSheet> createState() => _GiftCardBottomSheetState();
}

class _GiftCardBottomSheetState extends State<GiftCardBottomSheet> {
  late final userCubit = context.read<UserCubit>();

  final giftController = getIt<GiftController>();

  late User _authInfo;

  ValueNotifier<GiftCard?> selectedGift = ValueNotifier<GiftCard?>(null);

  @override
  void initState() {
    _authInfo = userCubit.currentUser!;
    giftController.getListGiftCard();
    giftController.getUserPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16)),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  avatar,
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userName,
                        const SizedBox(height: 5),
                        const PercentWidget(percent: 50),
                        const SizedBox(height: 4),
                        Text(S.of(context).gift_hint,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xffE3E3E3), thickness: 1, height: 0),
            giftType(),
            const SizedBox(height: 4),
            giftCommon(),
            const SizedBox(height: 12),
            Obx(() {
              return GiftPage(
                key: ObjectKey(giftController.giftCardList.value.giftList ?? []),
                gifts: giftController.giftCardList.value.giftList ?? [],
                selectedGift: selectedGift,
                onChanged: (GiftCard value) {
                  giftController.amount.value = 1;
                },
              );
            }),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  ImageWidget(
                    IconAppConstants.icCoin,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  ImageWidget(IconAppConstants.icChevronRight),
                  Obx(() {
                    return Text(giftController.userPointResponse.value.totalPoint?.toString() ?? '0',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ));
                  }),
                  Expanded(child: giftAmount()),
                  GestureDetector(
                    onTap: () {
                      if (selectedGift.value == null) return;
                      giftController.sentGift(
                          userId: widget.controller.info.user!.id!,
                          liveId: widget.controller.info.id,
                          giftId: selectedGift.value!.id!);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(colors: [Color(0xff971FF5), Color(0xffDE38EC)]),
                      ),
                      child: const Text("Ủng hộ",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget giftType() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: List<Widget>.generate(
              GiftType.values.length,
              (index) => GestureDetector(
                    onTap: () {
                      giftController.giftType.value = GiftType.values[index];
                      giftController.getListGiftCard();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            GiftType.values[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                              width: 22,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.5),
                                  color: giftController.giftType.value == GiftType.values[index]
                                      ? const Color(0xff9627df)
                                      : Colors.transparent))
                        ],
                      ),
                    ),
                  )),
        ),
      );
    });
  }

  Widget giftCommon() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: List<Widget>.generate(
              GiftCommon.values.length,
              (index) => GestureDetector(
                    onTap: () {
                      giftController.indexSelectCommon.value = index;
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                              color: giftController.indexSelectCommon.value == index
                                  ? const Color(0xff9627DF)
                                  : const Color(0xffFEEDFF),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            GiftCommon.values[index].title,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: giftController.indexSelectCommon.value == index
                                    ? Colors.white
                                    : const Color(0xff9627DF)),
                          ),
                        ),
                        const SizedBox(width: 12)
                      ],
                    ),
                  )),
        ),
      );
    });
  }

  Widget giftAmount() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: List<Widget>.generate(
              listAmount.length,
              (index) => GestureDetector(
                    onTap: () {
                      giftController.amount.value = listAmount[index];
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
                      decoration: BoxDecoration(
                          color: giftController.amount.value == listAmount[index]
                              ? const Color(0xff9627DF)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        listAmount[index].toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: giftController.amount.value == listAmount[index]
                                ? Colors.white
                                : const Color(0xff9627DF)),
                      ),
                    ),
                  )),
        ),
      );
    });
  }

  Widget get avatar {
    return CircleNetworkImage(
      url: _authInfo.avatar ?? '',
      size: 40,
      defaultImage: ImageWidget(
        ImageConstants.defaultUserAvatar,
        borderRadius: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget get userName {
    return Text(
      _authInfo.displayName ?? '',
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

enum GiftCommon { popular, latest, vip }

extension GiftCommonExt on GiftCommon {
  String get title {
    switch (this) {
      case GiftCommon.popular:
        return S.current.popular;
      case GiftCommon.latest:
        return S.current.latest;
      case GiftCommon.vip:
        return S.current.vip;
    }
  }
}

class PercentWidget extends StatelessWidget {
  final double percent;

  const PercentWidget({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constant) {
      return Stack(
        children: [
          Container(
              width: constant.maxWidth,
              height: 4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xffEAEDF0))),
          Container(
              width: constant.maxWidth * percent / 100,
              height: 4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xff9627df))),
        ],
      );
    });
  }
}
