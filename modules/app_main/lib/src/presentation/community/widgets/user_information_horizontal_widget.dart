import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/shared/mixins/user_info_mixin.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../shared/user/bloc/user_bloc.dart';

class UserHorizontalWidget extends StatefulWidget {
  const UserHorizontalWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<UserHorizontalWidget> createState() => _UserHorizontalWidgetState();
}

class _UserHorizontalWidgetState extends State<UserHorizontalWidget>
    with UserInfoMixin {
  late User _user;

  @override
  void initState() {
    super.initState();

    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.startPDoneByUserId(_user.id),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AvatarWidget(
                avatar: _user.avatar,
                size: 42,
                cacheHeight: 200,
                cacheWidth: 200,
                isPDone: _user.isPDone ?? false,
                isStar: false,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                _user.displayName ?? '',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // if (_user.isVShop == true)
                            //   GestureDetector(
                            //     behavior: HitTestBehavior.translucent,
                            //     onTap: () {
                            //       // context.startVshopDetailById(
                            //       //     id: _user.vShopPDoneId, showAppbar: true);
                            //     },
                            //     child: Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 12),
                            //       child: ImageWidget(IconConstants.vshop),
                            //     ),
                            //   ),
                          ],
                        ),
                      ),
                      if (_user.id != currentUserId)
                        BlocConsumer<UserBloc, UserState>(
                          listener: (context, state) {
                            if (state is UserAddFollowSuccess) {
                              showToastMessage('Đã gửi lời theo dõi');
                            }
                          },
                          builder: (context, state) {
                            var isFollowing = _user.isFollowed ?? false;
                            if (state is UserAddFollowSuccess) {
                              if (state.targetUserId == _user.id) {
                                isFollowing = state.isAddFollow;
                              }
                            }
                            return const SizedBox();
                            // return !isFollowing
                            //     ? GestureDetector(
                            //   behavior: HitTestBehavior.translucent,
                            //   onTap: () => _onTapFollow(_user.id!),
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 10, right: 9),
                            //     child: ImageWidget(IconConstants.follow),
                            //   ),
                            // )
                            //     : const SizedBox();
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      if (_user.pDoneId?.isNotEmpty ?? false)
                        Text(
                          _user.pDoneId!,
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                            fontSize: 12,
                            color: AppColors.grey20,
                          ),
                        ),
                      // if (_user.isJA == true) ...[
                      //   Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 8, right: 4),
                      //         child: AccountTypeWidget.ja(),
                      //       ),
                      //     ],
                      //   ),
                    // ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapFollow(int userId) {
    // if (context.isAuthenticated) {
    //   context.read<UserBloc>().add(AddFollowEvent(userId, true));
    //   _user = _user.copyWith(isFollowed: true);
    // }
  }
}
