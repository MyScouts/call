import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_data.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PkUserGiftLine extends StatefulWidget {
  const PkUserGiftLine({super.key});

  @override
  State<PkUserGiftLine> createState() => _PkUserGiftLineState();
}

class _PkUserGiftLineState extends State<PkUserGiftLine> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();
    return Obx(() {
      final members = controller.giftMembers.value;

      List<LiveMember> leftMembers =
          members.where((e) => e.liveID == controller.info.id).toList();
      List<LiveMember> rightMembers =
          members.where((e) => e.liveID == controller.liveOtherID).toList();

      return SizedBox(
        height: 48,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: leftMembers
                      .take(10)
                      .map<Widget>((e) => Positioned(
                            top: 0,
                            left: (18 * leftMembers.indexOf(e)).toDouble(),
                            child: _Avatar(url: e.info.avatar),
                          ))
                      .toList()
                      .separated(const SizedBox(width: 4)),
                ),
              ),
              Expanded(
                child: Stack(
                  children: rightMembers
                      .take(10)
                      .map<Widget>(
                        (e) => Positioned(
                          top: 0,
                          right: (18 * rightMembers.indexOf(e)).toDouble(),
                          child: _Avatar(url: e.info.avatar),
                        ),
                      )
                      .toList()
                      .separated(const SizedBox(width: 4)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleNetworkImage(
      url: url,
      size: 29,
      border: Border.all(color: const Color(0xffFFB800), width: 1.5),
    );
  }
}
