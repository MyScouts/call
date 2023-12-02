import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_event.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../blocs/my_profile_bloc.dart';
import 'components/create_post.dart';
import 'components/medial_tabs/post_tab.dart';
import 'components/medial_tabs/reels_tab.dart';
import 'components/medial_tabs/video_tab.dart';
import 'widgets/medial_tab_bar.dart';
import 'widgets/profile_avatar.dart';

class MyProfileScreen extends StatefulWidget {
  static const String routeName = "my_profile";

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  final bloc = getIt<MyProfileBloc>();

  late TabController _medialTabController;
  bool isScrolled = false;
  late StreamController<bool> _isScrolledController;

  @override
  void initState() {
    super.initState();

    _medialTabController = TabController(
      length: 3,
      vsync: this,
    );
    _isScrolledController = StreamController.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
    _medialTabController.dispose();
    _isScrolledController.close();
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 20.0;
    const bgHeight = 226.0;
    const imageAvatar = 136.0;
    double expandedHeight = bgHeight + imageAvatar / 2;
    double centerAvatarHeight = bgHeight - imageAvatar / 2;
    const ultilityHeight = 56.0;
    const paddingTopUltilityHeight = 8.0;
    double pinnedHeaderSliverHeightBuilder = kToolbarHeight * 2 +
        ultilityHeight +
        paddingTopUltilityHeight +
        statusBarHeight;

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: RefreshIndicator(
            notificationPredicate: (notification) {
              return notification.depth == 2;
            },
            onRefresh: () {
              bloc.add(MyProfileRefreshed());
              return Future.value(null);
            },
            child: ExtendedNestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  _buildHeaderBackground(
                    innerBoxIsScrolled,
                    expandedHeight,
                    imageAvatar,
                    bgHeight,
                    centerAvatarHeight,
                  ),
                  _buildInfoUser(borderRadius),
                  _buildUltility(
                    borderRadius: borderRadius,
                    paddingTopUltilityHeight: paddingTopUltilityHeight,
                    ultilityHeight: ultilityHeight,
                  ),
                  _buildCreatePost(),
                  _buildMedialTabs(),
                ];
              },
              pinnedHeaderSliverHeightBuilder: () {
                return pinnedHeaderSliverHeightBuilder;
              },
              onlyOneScrollInBody: true,
              body: TabBarView(
                controller: _medialTabController,
                children: [
                  BlocBuilder<MyProfileBloc, MyProfileState>(
                      buildWhen: (previous, current) =>
                          previous.posts != current.posts ||
                          previous.hasLoadMore != current.hasLoadMore,
                      builder: (context, state) {
                        return PostTab(
                          posts: state.posts,
                          key: const PageStorageKey('post-tab'),
                          onLoadMore: () {
                            if (!state.hasLoadMore) return;

                            bloc.add(MyProfileLoadMore());
                          },
                        );
                      }),
                  const VideoTab(
                    key: PageStorageKey('video-tab'),
                  ),
                  const ReelsTab(
                    key: PageStorageKey('reels-tab'),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  SliverAppBar _buildMedialTabs() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: MedialTabBar(controller: _medialTabController),
      centerTitle: false,
      elevation: 0,
      leadingWidth: 0,
      toolbarHeight: 64,
      primary: false,
      leading: const SizedBox.shrink(),
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }

  SliverAppBar _buildCreatePost() {
    return SliverAppBar(
      floating: false,
      pinned: false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
        child: const CreatePost(),
      ),
      centerTitle: false,
      elevation: 0,
      leadingWidth: 0,
      primary: false,
      leading: const SizedBox.shrink(),
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }

  Widget _buildUltility({
    required double ultilityHeight,
    required double paddingTopUltilityHeight,
    required double borderRadius,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
                color: AppColors.white,
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: ultilityHeight,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: AppColors.grey71,
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal),
                    padding: EdgeInsets.symmetric(
                        vertical: paddingTopUltilityHeight, horizontal: 12),
                    child: Row(
                      children: [
                        _buildItemUltility('Cá nhân', isSelected: true),
                        _buildDivider(),
                        _buildItemUltility('MarShop'),
                        _buildDivider(),
                        _buildItemUltility('Mục đã lưu'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoUser(double borderRadius) {
    return SliverToBoxAdapter(
      child: BlocBuilder<MyProfileBloc, MyProfileState>(
          buildWhen: (previous, current) =>
              previous.userInfo != current.userInfo,
          builder: (context, state) {
            final displayName = state.userInfo.getdisplayName;
            final nickname = state.userInfo.getNickname;
            final pDoneId = state.userInfo.getPDoneId;
            final sexIcon = state.userInfo.getSex.getIcon();
            final sexTextColor = state.userInfo.getSex.getTextColor();
            final sexBackgroundColor =
                state.userInfo.getSex.getBackgroundColor();
            final age = state.userInfo.getAge;
            final joinedteamAvatar = state.userInfo?.joinedTeam?.avatar ?? '';
            final joinedteamName = state.userInfo?.joinedTeam?.name ?? '';
            final totalFollower = state.userInfo.getTotalFollower.toString();
            final totalFollowing = state.userInfo.getTotalFollowing.toString();
            final totalFriend = state.userInfo.getTotalFriend.toString();

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
                          nickname,
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
                          if (joinedteamName.isNotEmpty)
                            const SizedBox(width: 7),
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
                          Container(
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
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            _buildPeopleInfo(
                              data: totalFollower,
                              title: 'Người hâm mộ',
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey,
                            ),
                            _buildPeopleInfo(
                              data: totalFollowing,
                              title: 'Đang theo dõi',
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey,
                            ),
                            _buildPeopleInfo(
                              data: totalFriend,
                              title: 'Bạn bè',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    ),
                    color: AppColors.white,
                  ),
                )
              ],
            );
          }),
    );
  }

  SliverAppBar _buildHeaderBackground(
      bool innerBoxIsScrolled,
      double expandedHeight,
      double imageAvatar,
      double bgHeight,
      double centerAvatarHeight) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      forceElevated: innerBoxIsScrolled,
      expandedHeight:
          innerBoxIsScrolled ? null : expandedHeight - statusBarHeight,
      titleSpacing: 0,
      elevation: 0,
      centerTitle: false,
      leading: StreamBuilder<bool>(
          stream: _isScrolledController.stream,
          initialData: isScrolled,
          builder: (context, snapshot) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: isScrolled ? AppColors.black : AppColors.white),
              onPressed: () => Navigator.of(context).pop(),
            );
          }),
      title: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
              child: StreamBuilder<bool>(
                  stream: _isScrolledController.stream,
                  initialData: isScrolled,
                  builder: (context, snapshot) {
                    const outlineBorderRadius = OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    );

                    return TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: " Search...",
                        focusedBorder: outlineBorderRadius,
                        enabledBorder: outlineBorderRadius,
                        errorBorder: outlineBorderRadius,
                        disabledBorder: outlineBorderRadius,
                        border: outlineBorderRadius,
                        filled: true,
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: isScrolled
                                ? AppColors.grey77
                                : AppColors.grey80.withOpacity(0.7),
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        fillColor: isScrolled
                            ? AppColors.grey71
                            : AppColors.black13.withOpacity(0.7),
                      ),
                      style: const TextStyle(
                        color: AppColors.grey80,
                        fontSize: 16.0,
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.close,
                color: AppColors.black,
                size: 24,
              ),
            ),
          ],
        ),
      ),
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          isScrolled = constraints.maxHeight <= imageAvatar;
          _isScrolledController.add(isScrolled);

          return SizedBox(
            height: expandedHeight,
            child: isScrolled
                ? const SizedBox.shrink()
                : _buildStackAvatarBackground(bgHeight, imageAvatar),
          );
        },
      ),
    );
  }

  Widget _buildStackAvatarBackground(double bgHeight, double imageAvatar) {
    return BlocBuilder<MyProfileBloc, MyProfileState>(
        buildWhen: (previous, current) => previous.userInfo != current.userInfo,
        builder: (context, state) {
          final bgImageUrl = state.userInfo.getBackgroundImage;
          final avatarUrl = state.userInfo.getUserAvatar;
          final isPDone = state.userInfo.getIsPdone;
          final backgroundImage = state.userInfo.getBackgroundImage;

          const sizeProfileType = 40.0;

          return Stack(
            children: [
              CachedNetworkImage(
                height: bgHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: bgImageUrl,
                errorWidget: (context, url, error) {
                  return ImageWidget(
                    backgroundImage,
                    height: bgHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ProfileAvatar(
                  avatarUrl: avatarUrl,
                  size: imageAvatar,
                  isPDone: isPDone,
                  sizeProfileType: sizeProfileType,
                  fontSize: 16,
                  profileTypePadding: 4,
                ),
              ),
            ],
          );
        });
  }

  Widget _buildPeopleInfo({required String data, required String title}) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            data,
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
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: VerticalDivider(),
    );
  }

  Widget _buildItemUltility(String text, {bool isSelected = false}) {
    return Expanded(
      flex: 3,
      child: InkWell(
        onTap: () => print('OnTap ultility'),
        child: Container(
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColors.white,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.blueEdit : AppColors.grey76,
            ),
          ),
        ),
      ),
    );
  }
}
