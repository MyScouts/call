import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_coordinator.dart';
import 'package:app_main/src/presentation/social/following/following_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class MyProfileInfoUser extends StatelessWidget {
  const MyProfileInfoUser({
    required this.userInfo,
    required this.userFollowDetail,
    super.key,
  });
  final User? userInfo;
  final GetUserFollowDetailResponse? userFollowDetail;

  @override
  Widget build(BuildContext context) {
    final displayName = userInfo.getdisplayName;
    final nickname = userInfo.getNickname;
    final pDoneId = userInfo.getPDoneId;
    final sexIcon = userInfo.getSex.getIcon();
    final sexTextColor = userInfo.getSex.getTextColor();
    final sexBackgroundColor = userInfo.getSex.getBackgroundColor();
    final age = userInfo.getAge;
    final joinedteamAvatar = userInfo?.joinedTeam?.avatar ?? '';
    final joinedteamName = userInfo?.joinedTeam?.name ?? '';
    final followerCount = userFollowDetail?.stats.followerCount ?? 0;
    final followeeCount = userFollowDetail?.stats.followeeCount ?? 0;
    final friendCount = userFollowDetail?.stats.friendCount ?? 0;
    const borderRadius = 20.0;

    return Column(
      children: [
        Container(
          color: AppColors.white,
          child: Column(
            children: [
              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              if (nickname.isNotEmpty)
                Text(
                  '($nickname)',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey76,
                  ),
                ),
              if (nickname.isNotEmpty) const SizedBox(height: 8),
              Text(
                'ID: $pDoneId',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: sexBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        ImageWidget(
                          sexIcon,
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          age != 0 ? '$age' : '',
                          style: TextStyle(
                            fontSize: 14,
                            color: sexTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    height: 28,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.blueEdit,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'LV.1',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (joinedteamName.isNotEmpty) const SizedBox(width: 7),
                  if (joinedteamName.isNotEmpty)
                    Flexible(
                      child: Container(
                        height: 28,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.blue6,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 12,
                              child: CircleAvatar(
                                child: joinedteamAvatar.isEmpty
                                    ? const SizedBox.shrink()
                                    : ImageWidget(joinedteamAvatar),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                joinedteamName,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(width: 7),
                  GestureDetector(
                    onTap: () => context.startQrCode(userInfo: userInfo!),
                    child: Container(
                      height: 28,
                      width: 28,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color(0XFFE8F0FE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ImageWidget(
                        IconAppConstants.icQrCode,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildPeopleInfo(
                      data: followerCount,
                      title: 'Người hâm mộ',
                      followingType: FollowingType.follower,
                      context: context,
                      followeeCount: followeeCount,
                      followerCount: followerCount,
                      friendCount: friendCount,
                      user: userInfo,
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey,
                    ),
                    _buildPeopleInfo(
                      data: followeeCount,
                      title: 'Đang theo dõi',
                      followingType: FollowingType.followee,
                      context: context,
                      followeeCount: followeeCount,
                      followerCount: followerCount,
                      friendCount: friendCount,
                      user: userInfo,
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey,
                    ),
                    _buildPeopleInfo(
                      data: friendCount,
                      title: 'Bạn bè',
                      followingType: FollowingType.friend,
                      context: context,
                      followeeCount: followeeCount,
                      followerCount: followerCount,
                      friendCount: friendCount,
                      user: userInfo,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 24,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
            color: AppColors.white,
          ),
        )
      ],
    );
  }

  Widget _buildPeopleInfo({
    required int data,
    required String title,
    required FollowingType followingType,
    required int friendCount,
    required int followerCount,
    required int followeeCount,
    required BuildContext context,
    required User? user,
  }) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (user != null) {
            context.startFollowing(
              user: user,
              followeeCount: followeeCount,
              friendCount: friendCount,
              followerCount: followerCount,
              followingType: followingType,
            );
          }
        },
        child: Column(
          children: [
            Text(
              data.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
