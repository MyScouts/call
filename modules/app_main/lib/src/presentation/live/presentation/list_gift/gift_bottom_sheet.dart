import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/live/presentation/list_gift/dialog_gift.dart';
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
    GiftCardBottomSheet.isShowBottom = true;
    _authInfo = userCubit.currentUser!;
    giftController.getListGiftCard();
    giftController.getUserPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16)),
            color: const Color(0xff000000).withOpacity(0.9)),
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
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffACACAC)))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: const Color(0xffffffff).withOpacity(0.1), thickness: 1, height: 0),
            giftType(),
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
                  Obx(() {
                    return Text(giftController.userWallet.value.availableCoin?.toStringAsFixed(0) ?? '0',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white));
                  }),
                  ImageWidget(
                    IconAppConstants.icChevronRight,
                    color: Colors.white,
                  ),
                  Expanded(child: giftAmount()),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
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
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: giftController.giftType.value == GiftType.values[index]
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: giftController.giftType.value == GiftType.values[index]
                                    ? const Color(0xffffffff)
                                    : const Color(0xffACACAC)),
                          ),
                          const SizedBox(height: 4),
                          Container(
                              width: 22,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.5),
                                  color: giftController.giftType.value == GiftType.values[index]
                                      ? const Color(0xffffffff)
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
      return Container(
        //padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(34),
              bottomLeft: Radius.circular(34),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            )),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List<Widget>.generate(listAmount.length, (index) {
                  Color backColor = giftController.amount.value.toString() == listAmount[index]
                      ? const Color(0xff4B84F7)
                      : Colors.transparent;
                  if (index == listAmount.length - 1 &&
                      giftController.amount.value > 0 &&
                      !listAmount.contains(giftController.amount.value.toString())) {
                    backColor = const Color(0xff4B84F7);
                  }
                  return GestureDetector(
                    onTap: () async {
                      try {
                        giftController.amount.value = int.tryParse(listAmount[index])!;
                      } catch (e) {
                        /// trường hợp khác
                        final text = await showDialog(
                            context: context,
                            builder: (context) {
                              return DialogInputGift(
                                init: giftController.amount.value > 0 ? giftController.amount.value.toString() : null,
                              );
                            });
                        if (int.tryParse(text) != null) {
                          giftController.amount.value = int.tryParse(text)!;
                        } else {
                          giftController.amount.value = 0;
                        }
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: backColor, borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        listAmount[index],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (selectedGift.value == null) return;
                if ((selectedGift.value?.coinValue ?? 0) * giftController.amount.value >
                    giftController.userWallet.value.availableCoin!) {
                  return context.showToastText('Bạn không đủ xu');
                }
                if (GiftCardBottomSheet.isShowBottom) {
                  if (context.mounted) {
                    Navigator.pop(context, selectedGift.value);
                  }
                }
                await giftController.sentGift(
                    userId: widget.controller.info.user!.id!,
                    liveId: widget.controller.info.id,
                    giftId: selectedGift.value!.id!);
                await giftController.getUserPoint();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9.5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(colors: [Color(0xff015CB5), Color(0xff0E86FC)]),
                ),
                child: const Text("Ủng hộ",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            )
          ],
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
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xff4B84F7))),
        ],
      );
    });
  }
}
