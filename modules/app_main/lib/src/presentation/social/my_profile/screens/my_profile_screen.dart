import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:design_system/design_system.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/create_post.dart';
import 'components/medial_tabs/post_tab.dart';
import 'components/medial_tabs/reels_tab.dart';
import 'components/medial_tabs/video_tab.dart';
import 'widgets/medial_tab_bar.dart';

class MyProfileScreen extends StatefulWidget {
  static const String routeName = "my_profile";

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _medialTabController;
  bool isScrolled = false;
  late StreamController<bool> _isScrolledController;

  final List<Widget> _medialTabsView = [
    const PostTab(
      key: PageStorageKey('post-tab'),
    ),
    const VideoTab(
      key: PageStorageKey('video-tab'),
    ),
    const ReelsTab(
      key: PageStorageKey('reels-tab'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _medialTabController = TabController(
      length: _medialTabsView.length,
      vsync: this,
    );
    _isScrolledController = StreamController.broadcast();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _medialTabController.dispose();
    _isScrolledController.close();
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = 20.0;
    const bgHeight = 226.0;
    const imageAvatar = 136.0;
    double expandedHeight = bgHeight + imageAvatar / 2;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SmartRefresher.builder(
        controller: RefreshController(),
        // controller: bloc.controller,
        enablePullDown: true,
        // enablePullUp: state.hasLoadMore,
        // onRefresh: () => bloc.add(Fetch()),
        // onLoading: () => bloc.add(LoadMore()),
        builder: (_, __) {
          return ExtendedNestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: innerBoxIsScrolled
                      ? null
                      : expandedHeight - statusBarHeight,
                  titleSpacing: 0,
                  elevation: 0,
                  centerTitle: false,
                  leading: StreamBuilder<bool>(
                      stream: _isScrolledController.stream,
                      initialData: isScrolled,
                      builder: (context, snapshot) {
                        return IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: isScrolled
                                  ? AppColors.black
                                  : AppColors.white),
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
                                return TextField(
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: " Search...",
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
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
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      isScrolled = constraints.maxHeight <= imageAvatar;
                      _isScrolledController.add(isScrolled);

                      return SizedBox(
                        height: expandedHeight,
                        child: isScrolled
                            ? const SizedBox.shrink()
                            : Stack(
                                children: [
                                  ImageWidget(
                                    ImageConstants.defaultUserBackground,
                                    width: double.infinity,
                                    height: bgHeight,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(
                                      height: imageAvatar,
                                      child: CircleAvatar(
                                        radius: imageAvatar,
                                        backgroundColor: AppColors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              8), // Border radius
                                          child: ClipOval(
                                            child: ImageWidget(
                                              ImageConstants.defaultUserAvatar,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: AppColors.white,
                        child: Column(
                          children: [
                            const Text(
                              'Trang Tran',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              '(Trang Mon)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey76,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'ID: VN4444650132',
                              style: TextStyle(
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
                                    color: AppColors.pink11,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      ImageWidget(
                                        Sex.female.getIcon(),
                                        width: 20,
                                        height: 20,
                                      ),
                                      const Text(
                                        '20',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.pink12,
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
                                        'LV.20',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Flexible(
                                  child: Container(
                                    height: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.blue6,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 12,
                                          child: CircleAvatar(),
                                        ),
                                        SizedBox(width: 4),
                                        Flexible(
                                          child: Text(
                                            'AE LION',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  _buildPeopleInfo(
                                    data: '34.512',
                                    title: 'Người hâm mộ',
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  _buildPeopleInfo(
                                    data: '124.892',
                                    title: 'Đang theo dõi',
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  _buildPeopleInfo(
                                    data: '22',
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
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius),
                          ),
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Container(
                          height: 16,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(borderRadius),
                              topRight: Radius.circular(borderRadius),
                            ),
                            color: AppColors.white,
                          ),
                        ),
                        Container(
                            color: Colors.white,
                            child: _buildBody(borderRadius)),
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  title: Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHorizontal),
                    child: const CreatePost(),
                  ),
                  centerTitle: false,
                  elevation: 0,
                  leadingWidth: 0,
                  toolbarHeight: 50,
                  primary: false,
                  leading: const SizedBox.shrink(),
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
                SliverAppBar(
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
                )
              ];
            },
            pinnedHeaderSliverHeightBuilder: () {
              return expandedHeight;
            },
            onlyOneScrollInBody: true,
            body: TabBarView(
              controller: _medialTabController,
              children: _medialTabsView,
            ),
          );
        },
      ),
    );
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

  Widget _buildBody(double borderRadius) {
    const paddingHorizontal = 16.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 56,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColors.grey71,
          ),
          margin: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              _buildUltility('Cá nhân', isSelected: true),
              _buildDivider(),
              _buildUltility('MarShop'),
              _buildDivider(),
              _buildUltility('Mục đã lưu'),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: VerticalDivider(),
    );
  }

  Widget _buildUltility(String text, {bool isSelected = false}) {
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
