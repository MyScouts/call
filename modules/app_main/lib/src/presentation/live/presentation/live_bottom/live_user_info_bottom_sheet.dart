import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import 'package:ui/ui.dart';

import '../../../../domain/usecases/user_share_preferences_usecase.dart';
import '../../../marshop/widgets/gradiant_button.dart';
import '../../../shared/user/bloc/user_bloc.dart';
import '../../../social/profile/profile_bloc.dart';
import 'user_detail_intarctive.dart';

class LiveUserInfoBottomView extends StatefulWidget {
  const LiveUserInfoBottomView({super.key, required this.userId});

  final int userId;

  @override
  State<LiveUserInfoBottomView> createState() => _LiveUserInfoBottomViewState();
}

class _LiveUserInfoBottomViewState extends State<LiveUserInfoBottomView> {
  final _kPaddingHorizontal = 20.0;
  User? userInfo;
  bool isFollowed = false;
  bool isFollowing = false;
  bool isFriend = false;

  @override
  void initState() {
    super.initState();
    context.read<GetUserByIdBloc>().add(GetDetailDataParam1Event(widget.userId));
  }

  Sex? get gender {
    if (userInfo?.sex?.title.toLowerCase() == 'nam') {
      return Sex.male;
    }
    if (userInfo?.sex?.title.toLowerCase() == 'nữ') {
      return Sex.female;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: BlocBuilder<GetUserByIdBloc, GetDetailState>(builder: (context, state) {
          if (state is GetDetailDataSuccess<User?>) {
            userInfo = state.data!;
            isFollowed = userInfo?.isFollowed ?? false;
            isFollowing = userInfo?.isFollowing ?? false;

            isFriend = isFollowed && isFollowing && (userInfo?.isFriend ?? false);
          }

          return BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserAddFollowSuccess) {
                isFollowed = state.isAddFollow;
              }
              if (state is UserAddFollowFail) {
                final bool isAddFollow = state.isAddFollow;
                showToastMessage(
                  isAddFollow ? 'Theo dõi thất bại!' : 'Bỏ dõi thất bại!',
                  ToastMessageType.error,
                );
              }
            },
            builder: (context, state) {
              print(userInfo);
              return Container(
                height: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      right: 0,
                      left: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AvatarWidget(
                                      avatar: userInfo?.avatar ?? ImageConstants.defaultAvatar,
                                      isPDone: userInfo?.isPDone ?? false,
                                      size: 100,
                                    ),
                                    if (userInfo?.displayName?.isNotEmpty == true)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '${userInfo!.displayName}',
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              fontWeight: FontWeight.w600, color: AppColors.black, fontSize: 14),
                                        ),
                                      ),
                                    if (userInfo?.pDoneId?.isNotEmpty ?? false)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Text(
                                          'ID: ${userInfo!.pDoneId}',
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              fontWeight: FontWeight.w400, color: AppColors.black, fontSize: 10),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          gender == null ? const SizedBox() : ImageWidget(IconAppConstants.icMaleSVG),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text('level20'),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       horizontal: 10),
                                          //   child: AddressCard(
                                          //       address:
                                          //           userInfo?.address ?? ''),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    const Divider(height: 29, color: AppColors.blue5, thickness: 0.5),
                                    UserDetailInteractive(
                                      follower: userInfo?.totalFollower ?? 0,
                                      following: userInfo?.totalFollowing ?? 0,
                                      friend: userInfo?.totalFriend ?? 0,
                                      onTap: (p0) {},
                                    ),
                                  ],
                                ),
                                // Visibility(
                                //   visible: !injector.get<UserSharePreferencesUsecase>().isMe(widget.user.id),
                                //   child: Positioned(
                                //     top: 16,
                                //     left: 16,
                                //     child: BlocListener<ReportUserBloc, GetDetailState>(
                                //       listener: _listenerReportUserBloc,
                                //       child: GestureDetector(
                                //         onTap: () {
                                //           context.startUserReport(widget.user.id!);
                                //         },
                                //         behavior: HitTestBehavior.translucent,
                                //         child: Column(
                                //           children: [
                                //             // ImageWidget(
                                //             //   IconConstants.report,
                                //             //   color: Colors.white,
                                //             // ),
                                //             const SizedBox(
                                //               height: 1,
                                //             ),
                                //             Text(
                                //               'Báo cáo',
                                //               style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                //                   fontWeight: FontWeight.w600, color: AppColors.white, fontSize: 8),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Visibility(
                                //   visible: isShowSetting,
                                //   child: Positioned(
                                //     top: 16,
                                //     right: 16,
                                //     child: BlocListener<ReportUserBloc,
                                //         GetDetailState>(
                                //       listener: _listenerReportUserBloc,
                                //       child: GestureDetector(
                                //         onTap: () {
                                //           context.startSettingDialog(
                                //               widget.liveDetail.id!,
                                //               widget.user,
                                //               widget.userRole,
                                //               widget.myRole);
                                //         },
                                //         behavior: HitTestBehavior.translucent,
                                //         child: Column(
                                //           children: [
                                //             ImageWidget(
                                //               IconConstants.settings_1,
                                //               color: Colors.white,
                                //             ),
                                //             const SizedBox(
                                //               height: 1,
                                //             ),
                                //             Text(
                                //               'Quản lý',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .bodySmall
                                //                   ?.copyWith(
                                //                       fontWeight:
                                //                           FontWeight.w600,
                                //                       color: AppColors.white,
                                //                       fontSize: 8),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //nút bấm
                    Positioned(
                      bottom: _kPaddingHorizontal,
                      right: 0,
                      left: 0,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            _kPaddingHorizontal,
                            8,
                            _kPaddingHorizontal,
                            8,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                visible: userInfo?.joinedTeam != null,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        height: 44,
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color.fromARGB(255, 241, 84, 73),
                                                Colors.red,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(8))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                                          child: Row(
                                            children: [
                                              // ImageWidget(
                                              //     ImageConstants.teamLion),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Team',
                                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    userInfo?.joinedTeam?.name ?? '',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ))
                                            ],
                                          ),
                                        ))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              buildActionButtons(userInfo, context)
                            ],
                          )),
                    ),
                  ],
                ),
              );
            },
          );
        }));
  }

  Widget buildActionButtons(User? userInfo, BuildContext context) {
    String text;
    BoxBorder? border;
    Gradient? gradient;
    if (isFollowed) {
      text = 'Bỏ theo dõi';
      gradient = const LinearGradient(
        colors: [AppColors.grey8, AppColors.grey8],
      );
      border = GradientBoxBorder(
        width: 2,
        gradient: gradient,
      );
    } else {
      text = 'Theo dõi';
      border = GradientBoxBorder(
        width: 2,
        gradient: Theme.of(context).themeDecoration.gradientPrimary,
      );
      gradient = const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      );
    }
    if (isFriend) {
      text = 'Nhắn tin';
      border = GradientBoxBorder(
        width: 2,
        gradient: Theme.of(context).themeDecoration.gradientPrimary,
      );
      gradient = const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      );
    }
    return Row(
      children: [
        Visibility(
          visible: !injector.get<UserSharePreferencesUsecase>().isMe(widget.userId),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GradiantButton(
                onPressed: () async {
                  if (userInfo != null) {
                    if (isFriend) {
                      // await context.startConversationDetailWithUserId(userInfo.id!);
                      return;
                    }
                    EasyDebounce.debounce(
                      'deboundFollow',
                      const Duration(milliseconds: 200),
                      () {
                        context.read<UserBloc>().add(AddFollowEvent(widget.userId, !isFollowed));
                      },
                    );
                  }
                },
                border: border,
                gradient: gradient,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GradiantButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(PDoneScreen.routeName, arguments: {'userId': widget.user.id});
            },
            child: const Text('Trang cá nhân'),
          ),
        )
      ],
    );
  }
}
