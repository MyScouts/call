import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/profile/diary_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DiaryMenuActions extends StatefulWidget {
  final User userInfo;
  const DiaryMenuActions({
    super.key,
    required this.userInfo,
  });

  @override
  State<DiaryMenuActions> createState() => _DiaryMenuActionsState();
}

class _DiaryMenuActionsState extends State<DiaryMenuActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: .1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CloseButton(),
                  ),
                ),
                Text(
                  widget.userInfo.getDisplayName,
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => context.startReportUser(userInfo: widget.userInfo),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: .1),
                ),
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.error_outline),
                        const SizedBox(width: 4),
                        Text(
                          "Báo cáo",
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final result =
                  await context.startBlockUser(userInfo: widget.userInfo);
              if (result != null) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context, result);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: .1),
                ),
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.block_flipped),
                        const SizedBox(width: 4),
                        Text(
                          "Chặn",
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
