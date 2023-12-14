import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/live_coordinator.dart';
import 'package:app_main/src/presentation/live/presentation/channel/state/live_channel_controller.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:provider/provider.dart';
import 'package:ui/ui.dart';

import '../../../../../blocs/user_action/user_action_cubit.dart';
import '../../../../../data/models/payloads/user/user_action_payload.dart';
import '../../../../../data/models/responses/follow_response.dart';
import 'leave_live_confirm.dart';
import 'live_end_sheet.dart';

class LiveChannelHeader extends StatefulWidget {
  const LiveChannelHeader({super.key});

  @override
  State<LiveChannelHeader> createState() => _LiveChannelHeaderState();
}

class _LiveChannelHeaderState extends State<LiveChannelHeader> {
  late final controller = context.read<LiveChannelController>();
  late final LiveMessageBloc commentController;

  final UserActionCubit _actionBloc = injector.get<UserActionCubit>();

  @override
  void initState() {
    commentController = context.read<LiveMessageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffDFEBFD),
                  Color(0xff2697D6),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(90),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff0058DB),
                      Color(0xff10306F),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Obx(() {
                  final host = controller.members.firstWhereOrNull(
                      (e) => e.isOwner && e.liveID == controller.info.id);
                  return IntrinsicHeight(
                    child: Row(
                      children: [
                        if (host == null || host.info.avatar.trim().isEmpty)
                          GestureDetector(
                            onTap: () {
                              context
                                  .startSelectUser(userId: host!.info.userID)
                                  .then((value) {
                                _actionBloc.getFollowUser(
                                    userId: host.info.userID);
                              });
                            },
                            child: SizedBox.square(
                              dimension: 28,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(28 / 2),
                                child: ImageWidget(
                                  ImageConstants.defaultUserAvatar,
                                ),
                              ),
                            ),
                          )
                        else
                          GestureDetector(
                            onTap: () {
                              context
                                  .startSelectUser(userId: host.info.userID)
                                  .then((value) {
                                _actionBloc.getFollowUser(
                                    userId: host.info.userID);
                              });
                            },
                            child: CircleNetworkImage(
                              url: host.info.avatar,
                              size: 28,
                            ),
                          ),
                        const SizedBox(width: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              host?.info.name ?? '',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox.square(
                                  dimension: 12,
                                  child: ImageWidget(
                                    IconAppConstants.icDiamond,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Obx(() {
                                  return Text(
                                    controller.liveState.value.diamondCount
                                            ?.toString() ??
                                        '0',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Obx(() {
                          final host = controller.members.firstWhereOrNull(
                              (e) =>
                                  e.isOwner && e.liveID == controller.info.id);
                          if (host == null) {
                            return const SizedBox();
                          }
                          if (controller.me.value.isOwner) {
                            return const SizedBox();
                          }
                          return LiveButtonAddFriend(
                            id: host.info.userID,
                            cubit: _actionBloc,
                          );
                        }),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.showBottomSheetLive(controller);
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                Obx(() {
                  if (controller.giftCardLive.value.giversInfo == null) {
                    return const SizedBox();
                  }
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: controller.giftCardLive.value.giversInfo!
                        .mapIndexed((index, element) {
                          if (index == 0) {
                            return GestureDetector(
                              onTap: () {
                                context.startSelectUser(
                                    userId: element.giver!.id!);
                              },
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Stack(
                                  children: [
                                    ImageWidget(
                                      IconAppConstants.icTop1Awards,
                                      width: 40,
                                      height: 40,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        child: AvatarWidget(
                                          avatar: element.giver?.avatar,
                                          size: 25,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                context.startSelectUser(
                                    userId: element.giver!.id!);
                              },
                              child: AvatarWidget(
                                  avatar: element.giver?.avatar, size: 30),
                            ),
                          );
                        })
                        .take(2)
                        .toList()
                        .separated(const SizedBox(width: 8)),
                  );
                }),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      ImageWidget(IconAppConstants.icLiveMember),
                      const SizedBox(width: 2),
                      Obx(
                        () {
                          final members = controller.members.value;

                          final liveMembers = members
                              .where((e) => e.liveID == controller.info.id);

                          return Text(
                            liveMembers.length.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                CloseButton(
                  color: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => LeaveLiveConfirm(
                        onRemoved: () {
                          controller.leaveLive();
                          if (controller.me.value.isOwner) {
                            if (controller.liveType.value !=
                                LiveChannelType.pk) {
                              Navigator.of(context).pop();
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => showModalBottomSheet(
                                  context: AppCoordinator
                                      .rootNavigator.currentContext!,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => const LiveEndSheet(),
                                ),
                              );
                            }
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LiveButtonAddFriend extends StatefulWidget {
  final UserActionCubit cubit;
  final int id;

  const LiveButtonAddFriend({super.key, required this.id, required this.cubit});

  @override
  State<LiveButtonAddFriend> createState() => _LiveButtonAddFriendState();
}

class _LiveButtonAddFriendState extends State<LiveButtonAddFriend> {
  final ValueNotifier<bool> _friendStatus = ValueNotifier(false);
  late UserActionCubit _actionBloc;

  final ValueNotifier<GetUserFollowDetailResponse?> _followInfo =
      ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _actionBloc = widget.cubit;
    _actionBloc.getFollowUser(userId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => _actionBloc,
      child: BlocConsumer<UserActionCubit, UserActionState>(
        listener: (context, state) {
          if (state is GetFollowUserSuccess) {
            _followInfo.value = state.followDetail;
          }

          if (state is OnFollowUser || state is OnUnFollow) {
            showLoading();
          }
          if (state is FollowUserSuccess) {
            hideLoading();
            _friendStatus.value = true;
            if (state.approvalRequired) {
              showToastMessage(
                  "Yêu cầu theo dõi đã được gởi đến người bảo hộ.");
            } else {
              showToastMessage("Theo dõi người dùng thành công.");
            }
          }

          if (state is FollowUserFail) {
            hideLoading();
            showToastMessage(state.message, ToastMessageType.error);
          }

          if (state is UnFollowSuccess) {
            hideLoading();
            _friendStatus.value = false;
            showToastMessage("Bỏ theo dõi người dùng thành công.");
          }

          if (state is UnFollowFail) {
            hideLoading();
            _friendStatus.value = false;

            showToastMessage(state.message, ToastMessageType.error);
          }
        },
        builder: (BuildContext context, UserActionState state) {
          return ValueListenableBuilder(
            valueListenable: _followInfo,
            builder: (BuildContext context, GetUserFollowDetailResponse? value,
                Widget? child) {
              final relation = value?.relation;
              if (relation?.isFollower == false) {
                return GestureDetector(
                  onTap: () {
                    context.read<UserActionCubit>().followUser(
                          payload: FollowUserPayload(followeeId: widget.id),
                        );
                  },
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.add,
                      color: Color(0xff4B84F7),
                      size: 16,
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    ));
  }
}
