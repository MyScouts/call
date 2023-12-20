import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_pk_data.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';

class PkConfigSheet extends StatefulWidget {
  const PkConfigSheet({super.key, required this.onGameStarted});

  final Function(Game game) onGameStarted;

  @override
  State<PkConfigSheet> createState() => _PkConfigSheetState();
}

class _PkConfigSheetState extends State<PkConfigSheet> {
  int round = 1;
  int time = 3;
  int timeBreak = 30;
  final FocusNode _roundTimeNode = FocusNode();
  final FocusNode _roundBreakTimeNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LiveChannelController>();

    final host = controller.members
        .firstWhereOrNull((e) => e.info.userID == controller.pkData!.pk.hostID);

    final me = controller.members.firstWhereOrNull(
        (e) => e.info.userID != host!.info.userID && e.isOwner);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
      child: Container(
        height: ScreenUtil().screenHeight * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            centerTitle: true,
            title: const Text(
              'Mời',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: _UserCard(
                          info: host!.info,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Assets.icons_lives_ic_double_arrow.svg(),
                      const SizedBox(width: 5),
                      Expanded(
                        child: _UserCard(
                          info: me!.info,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    const Text(
                      'Chế độ DK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    _RoundPk(
                      title: 'DK 1 vòng',
                      active: round == 1,
                      onTap: () {
                        setState(() {
                          round = 1;
                        });
                      },
                    ),
                    // const SizedBox(width: 4),
                    // _RoundPk(
                    //   title: 'DK 3 vòng',
                    //   active: round == 3,
                    //   onTap: () {
                    //     setState(() {
                    //       round = 3;
                    //     });
                    //   },
                    // ),
                    const SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    _roundTimeNode.requestFocus();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Text(
                        'Thời gian',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: '$time',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff8C8C8C),
                            fontWeight: FontWeight.w400,
                          ),
                          focusNode: _roundTimeNode,
                          onChanged: (value) {
                            if (value.trim().isEmpty) {
                              setState(() {
                                time = 0;
                              });
                            } else {
                              setState(() {
                                time = int.tryParse(value) ?? 0;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Text(
                        ' phút',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff8C8C8C),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    _roundBreakTimeNode.requestFocus();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Text(
                        'Thời gian nghỉ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          initialValue: '$timeBreak',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff8C8C8C),
                            fontWeight: FontWeight.w400,
                          ),
                          focusNode: _roundBreakTimeNode,
                          onChanged: (value) {
                            if (value.trim().isEmpty) {
                              setState(() {
                                timeBreak = 0;
                              });
                            } else {
                              setState(() {
                                timeBreak = int.tryParse(value) ?? 0;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const Text(
                        's',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff8C8C8C),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ColoredBox(
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: GestureDetector(
                onTap: () {
                  if (time <= 0 || timeBreak <= 0) {
                    context.showToastMessage(
                      'Vui lòng chọn thời gian',
                      ToastMessageType.error
                    );
                    return;
                  }
                  Navigator.of(context).pop();
                  widget.onGameStarted(
                    Game(
                      id: 0,
                      roundCount: round,
                      roundDurationSecond: time * 60,
                      roundTimeBreak: timeBreak,
                    ),
                  );
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff015CB5),
                        Color(0xff0E86FC),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Bắt đầu DK',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RoundPk extends StatelessWidget {
  const _RoundPk({
    super.key,
    required this.title,
    this.active = false,
    this.onTap,
  });

  final String title;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: active
                ? const [
                    Color(0xff3679F6),
                    Color(0xff79F7DD),
                  ]
                : [
                    Colors.white,
                    Colors.white,
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: active ? Colors.transparent : const Color(0xffE1E1E1),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: active ? Colors.white : const Color(0xff6E6E6E),
          ),
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({super.key, required this.info});

  final LiveMemberInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff4B84F7)),
      ),
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -44,
            child: CircleNetworkImage(
              url: info.avatar,
              size: 40,
              defaultImage: ImageWidget(
                ImageConstants.defaultUserAvatar,
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: Text(
                      info.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Assets.icons_lives_chienbinh.image(
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'Chiến binh Lv.1',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: Color(0xff6E6E6E),
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xff8A56FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      child: Text(
                        'Lv.1',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
