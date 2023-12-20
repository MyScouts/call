import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_event.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_state.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/my_profile_info_user.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/medial_tab_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../blocs/my_profile_bloc.dart';
import 'widgets/my_profile_create_post.dart';
import 'components/ultility_tabs/medial_tabs/post_tab.dart';
import 'components/ultility_tabs/medial_tabs/film_tab.dart';
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

  // final postTabKey = const PageStorageKey('post-tab');
  // final videoTabKey = const PageStorageKey('video-tab');
  // final reelsTabKey = const PageStorageKey('reels-tab');

  late TabController _medialTabController;
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();

    _medialTabController = TabController(
      length: 3,
      vsync: this,
    );

    bloc.add(MyProfileInitiated());
  }

  @override
  void dispose() {
    super.dispose();
    _medialTabController.dispose();
    bloc.isScrolledController.close();
    bloc.switchTabController.close();
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
            onRefresh: _onRefresh,
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
              body: BlocBuilder<MyProfileBloc, MyProfileState>(
                  buildWhen: (previous, current) =>
                      previous.userInfo != current.userInfo,
                  builder: (context, state) {
                    if (state.isNotExistUser()) {
                      return Container(
                        color: AppColors.white,
                        child: const Center(child: LoadingWidget()),
                      );
                    }
                    final userInfo = state.userInfo!;

                    return Container(
                      color: AppColors.white,
                      child: TabBarView(
                        controller: _medialTabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          PostTab(
                            postType: PostType.text,
                            refresh: bloc.postTabRefresh,
                            createPostPayload: bloc.createTextPostPayload,
                            userInfo: userInfo,
                          ),
                          PostTab(
                            postType: PostType.video,
                            refresh: bloc.videoTabRefresh,
                            createPostPayload: bloc.createVideoPostPayload,
                            userInfo: userInfo,
                          ),
                          FilmTab(
                            postType: PostType.film,
                            refresh: bloc.filmTabRefresh,
                            userInfo: userInfo,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )),
    );
  }

  Future<void> _onRefresh() {
    bloc.add(MyProfileRefreshed());

    switch (bloc.state.currentPostType) {
      case PostType.text:
        bloc.postTabRefresh.value = !bloc.postTabRefresh.value;
      case PostType.video:
        bloc.videoTabRefresh.value = !bloc.videoTabRefresh.value;
      case PostType.film:
        bloc.filmTabRefresh.value = !bloc.filmTabRefresh.value;
    }

    return Future.value(null);
  }

  SliverAppBar _buildMedialTabs() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: StreamBuilder<int>(
        stream: bloc.switchTabController.stream,
        builder: (context, snapshot) {
          return MedialTabBar(
            index: _medialTabController.index,
            onChange: _onChangeMedialTab,
          );
        },
      ),
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

  void _onChangeMedialTab(int index) {
    _medialTabController.animateTo(index);
    bloc.switchTabController.add(index);
    bloc.add(IndividualSwitchTab(index: index));
  }

  SliverAppBar _buildCreatePost() {
    return SliverAppBar(
      floating: false,
      pinned: false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        height: 56,
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<MyProfileBloc, MyProfileState>(
            buildWhen: (previous, current) =>
                previous.userInfo != current.userInfo ||
                previous.currentPostType != current.currentPostType,
            builder: (context, state) {
              return MyProfileCreatePost(
                user: state.userInfo,
                onTapCreatePost: () {
                  _onTapCreatePost(
                    userInfo: state.userInfo,
                    postType: state.currentPostType,
                    isShowMedia: false,
                  );
                },
                onTapImage: () {
                  const postType = PostType.text;
                  _onTapCreatePost(
                    userInfo: state.userInfo,
                    postType: postType,
                    isShowMedia: true,
                  );
                },
                onTapVideo: () {
                  const postType = PostType.video;
                  _onTapCreatePost(
                    userInfo: state.userInfo,
                    postType: postType,
                    isShowMedia: true,
                  );
                },
              );
            }),
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

  Future<void> _onTapCreatePost({
    required User? userInfo,
    required PostType postType,
    required bool isShowMedia,
  }) async {
    final index = postType.index;
    _onChangeMedialTab(index);

    final data = await context.startCreatePost(
      postType: postType,
      user: userInfo,
      isShowMedia: isShowMedia,
    );
    if (data != null) {
      final post = data as CreatePostPayload;
      bloc.add(CreateNewPost(createPostPayload: post));
    }
  }

  Widget _buildUltility({
    required double ultilityHeight,
    required double paddingTopUltilityHeight,
    required double borderRadius,
  }) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 16.w),
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
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    padding: EdgeInsets.symmetric(
                        vertical: paddingTopUltilityHeight, horizontal: 12.w),
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
              previous.userInfo != current.userInfo ||
              previous.userFollowDetail != current.userFollowDetail,
          builder: (context, state) {
            return MyProfileInfoUser(
              userFollowDetail: state.userFollowDetail,
              userInfo: state.userInfo,
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
      backgroundColor: AppColors.white,
      leading: StreamBuilder<bool>(
          stream: bloc.isScrolledController.stream,
          initialData: isScrolled,
          builder: (context, snapshot) {
            return IconButton(
              icon: Icon(Icons.arrow_back,
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
                  stream: bloc.isScrolledController.stream,
                  initialData: isScrolled,
                  builder: (context, snapshot) {
                    const outlineBorderRadius = OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide.none,
                    );

                    return TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Tìm kiếm",
                        focusedBorder: outlineBorderRadius,
                        enabledBorder: outlineBorderRadius,
                        errorBorder: outlineBorderRadius,
                        disabledBorder: outlineBorderRadius,
                        border: outlineBorderRadius,
                        filled: true,
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ImageWidget(
                            IconAppConstants.icSearch,
                            color: isScrolled
                                ? AppColors.grey77
                                : AppColors.grey80.withOpacity(0.7),
                            fit: BoxFit.cover,
                          ),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 20),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        fillColor: isScrolled
                            ? AppColors.grey71
                            : AppColors.black13.withOpacity(0.7),
                      ),
                      style: TextStyle(
                        color: AppColors.grey80.withOpacity(0.7),
                        fontSize: 16.0,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () {
                  context.startDashboardUtil();
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.black,
                  size: 28,
                ),
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
          bloc.isScrolledController.add(isScrolled);

          return Container(
            height: expandedHeight,
            color: AppColors.white,
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

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: VerticalDivider(),
    );
  }

  Widget _buildItemUltility(String text, {bool isSelected = false}) {
    return Expanded(
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
