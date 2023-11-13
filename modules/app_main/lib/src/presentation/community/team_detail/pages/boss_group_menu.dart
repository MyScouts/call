import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/community_coordinator.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class BossGroupMenu extends StatefulWidget {
  final Team team;
  const BossGroupMenu({
    super.key,
    required this.team,
  });

  @override
  State<BossGroupMenu> createState() => _BossGroupMenuState();
}

class _BossGroupMenuState extends State<BossGroupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: paddingHorizontal,
        left: paddingHorizontal,
        bottom: 30,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(),
          _buildMenu(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: .2),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: CustomCloseButton(
                  alignment: Alignment.centerLeft,
                  onPressed: () => Navigator.pop(context),
                )),
          ),
          Text(
            widget.team.name ?? "",
            style: context.textTheme.titleMedium!.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  _buildMenu() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context
                .startRemoveBossModal(
              member: widget.team.boss!,
              team: widget.team,
            )
                .then((value) {
              if (value != null) {
                Navigator.pop(context, true);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: .2),
            )),
            child: Row(
              children: [
                const Icon(Icons.error_outline),
                const SizedBox(width: 5),
                Text(
                  "Hủy quyền của Boss Team",
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => context.startAssignTeam(widget.team).then((value) {
            if (value != null && value == true) {
              Navigator.pop(context, true);
            }
          }),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey, width: .2),
            )),
            child: Row(
              children: [
                const Icon(Icons.person_2_outlined),
                const SizedBox(width: 5),
                Text(
                  "Chỉ định Boss Team",
                  style: context.textTheme.titleMedium,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
