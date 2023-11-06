import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/shared/user/bloc/user_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HeaderProfilePdoneWidget extends StatelessWidget {
  const HeaderProfilePdoneWidget({
    super.key,
    required this.isMe,
    required this.userInfo,
    required this.isLoading,
    required this.userId,
    this.paddingHeader,
  });

  final bool isMe;
  final User? userInfo;
  final bool isLoading;
  final String? userId;
  final EdgeInsets? paddingHeader;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDoneHeaderWidget(
          paddingHeader: paddingHeader ?? const EdgeInsets.only(top: 16.0),
          isMe: isMe,
          user: userInfo,
          isLoading: isLoading,
        ),
        if (userId != null)
          Positioned(
            top: 15,
            left: 16,
            child: GestureDetector(
              onTap: Navigator.of(context).pop,
              child: const Icon(
                Icons.arrow_back_sharp,
                color: AppColors.black10,
              ),
            ),
          ),
      ],
    );
  }
}

class PDoneHeaderWidget extends StatelessWidget {
  const PDoneHeaderWidget({
    super.key,
    this.user,
    this.isLoading = false,
    this.isMe = false,
    this.paddingHeader = const EdgeInsets.only(top: 16.0),
  });

  final User? user;
  final bool isLoading;
  final bool isMe;
  final EdgeInsets paddingHeader;

  @override
  Widget build(BuildContext context) {
    final userInfo = user ??
        (isLoading
            ? null
            : (isMe ? context.read<UserBloc>().state.currentUser : null));

    return Padding(
      padding: paddingHeader,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        var avatar =
                            isMe ? state.currentUser?.avatar : userInfo?.avatar;
                        avatar = avatar ?? ImageConstants.defaultAvatar;
                        return Container();
                        // return userInfo == null
                        //     ? Padding(
                        //         padding: const EdgeInsets.only(top: 30.0),
                        //         child: SizedBox(
                        //           width: 108,
                        //           height: 108,
                        //           child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(65),
                        //             child: const Skeleton(),
                        //           ),
                        //         ),
                        //       )
                        //     : UserAvatarMember(
                        //         avatar: avatar,
                        //         isPDone: userInfo.isPDone ?? false,
                        //         size: const Size(108, 108),
                        //         borderColor: Colors.white,
                        //         onTap: () {
                        //           context.onTapDetailImage(
                        //             avatar!,
                        //             isLeftCloseButton: false,
                        //             isLocalAsset:
                        //                 avatar == ImageConstants.defaultAvatar,
                        //           );
                        //         },
                        //       );
                      },
                    ),
                    if (userInfo?.name?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text(
                          userInfo?.name ?? '',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,
                                  ),
                        ),
                      ),
                    // BlocBuilder<UserBloc, UserState>(
                    //   builder: (context, state) {
                    //     final String? nickname = isMe
                    //         ? state.currentUser?.nickname
                    //         : userInfo?.nickname;
                    //     if (nickname == null || nickname.isEmpty) {
                    //       return const SizedBox();
                    //     }
                    //     return Padding(
                    //       padding: const EdgeInsets.only(top: 8.0),
                    //       child: Center(
                    //         child: Text(
                    //           nickname,
                    //           textAlign: TextAlign.center,
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headlineMedium
                    //               ?.copyWith(
                    //                 fontWeight: FontWeight.w700,
                    //               ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                    if (userInfo?.name?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          '(${userInfo!.name})',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.0,
                                  ),
                        ),
                      ),
                    if (userInfo?.pDoneId?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'ID: ${userInfo!.pDoneId}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // if (!Configurations.isProduction)
                          //   const GenderCard(age: 20, gender: Sex.male),
                          // if (!Configurations.isProduction)
                          //   const Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 10),
                          //     child: LevelCard(level: 20),
                          //   ),
                          // if (userInfo?.joinedTeam?.name?.isNotEmpty ?? false)
                          // IconHorizontalButton(
                          //   onTap: () {
                          //     context.startTeamDetail(
                          //         id: userInfo?.joinedTeam?.id);
                          //   },
                          //   prefixIcon:
                          //       ImageWidget(ImageConstants.memberLogo),
                          //   sufixIcon:
                          //       const Icon(Icons.arrow_forward_ios_rounded),
                          //   label: userInfo!.joinedTeam!.name!,
                          // ),
                          // if (!Configurations.isProduction)
                          //   Padding(
                          //     padding: const EdgeInsets.only(left: 10),
                          //     child: IconButtonWidget(icon: IconConstants.card),
                          //   ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // isMe
                    //     ? BlocBuilder<UserBloc, UserState>(
                    //         builder: (context, state) {
                    //           return InteractiveSocial(
                    //             follower: state.currentUser?.totalFollower ?? 0,
                    //             following:
                    //                 state.currentUser?.totalFollowing ?? 0,
                    //             friend: state.currentUser?.totalFriend ?? 0,
                    //             onTap: (p0) {
                    //               if (state.currentUser != null) {
                    //                 context.startUserFollow(
                    //                   status: UserStatus.values[p0],
                    //                   user: state.currentUser!,
                    //                 );
                    //               }
                    //             },
                    //           );
                    //         },
                    //       )
                    //     : InteractiveSocial(
                    //         follower: userInfo?.totalFollower ?? 0,
                    //         following: userInfo?.totalFollowing ?? 0,
                    //         friend: userInfo?.totalFriend ?? 0,
                    //         onTap: (p0) {
                    //           if (userInfo != null) {
                    //             context.startUserFollow(
                    //               status: UserStatus.values[p0],
                    //               user: userInfo,
                    //             );
                    //           }
                    //         },
                    //       ),
                  ],
                ),
                // if (isMe == false)
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: BlocListener<ReportUserBloc, GetDetailState>(
                //     listener: (BuildContext context, GetDetailState state) {
                //       if (state is GetDetailDataSuccess) {
                //         context.showToastMessage(
                //             'Báo cáo người dùng thành công!');
                //       }
                //     },
                //     child: DropdownMenuButton<SocialPostAction>(
                //       builder: (item) => DropdownItemWidget(
                //         icon: item.icon,
                //         text: item.text,
                //         colorIcon: const Color(0xff666666),
                //       ),
                //       onChanged: (value) {
                //         if (userInfo != null) {
                //           if (value?.text == 'Chặn') {
                //             context.startBlock(context, userInfo.id!,
                //                 userInfo.getdisplayName);
                //           } else if (value?.text == 'Báo cáo') {
                //             context.startUserReport(userInfo.id!);
                //           }
                //         }
                //       },
                //       items: [
                //         SocialPostAction(
                //           icon: IconConstants.report,
                //           text: 'Báo cáo',
                //         ),
                //         SocialPostAction(
                //           icon: IconConstants.blockUser,
                //           text: 'Chặn',
                //         )
                //       ],
                //       customButton: GestureDetector(
                //         behavior: HitTestBehavior.translucent,
                //         child: SizedBox(
                //           width: 25,
                //           height: 25,
                //           child: ImageWidget(IconConstants.menu02),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const Divider(height: 29, color: AppColors.blue5, thickness: 2),
        ],
      ),
    );
  }
}
