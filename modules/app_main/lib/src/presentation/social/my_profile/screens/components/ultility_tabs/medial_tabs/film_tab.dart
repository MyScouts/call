import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/film_tab_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/film_tab_event.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/film_tab_state.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/post_tab_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/custom_button.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/subordinate_scroll.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/empty_post.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_video_thumbnail_widget.dart';
import 'package:app_main/src/presentation/social/widgets/social_refresher.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:ui/ui.dart';

class FilmTab extends StatefulWidget {
  const FilmTab({
    required this.postType,
    required this.refresh,
    required this.userInfo,
    super.key,
  });
  final PostType postType;
  final ValueNotifier<bool> refresh;
  final User userInfo;

  @override
  State<FilmTab> createState() => _FilmTabState();
}

class _FilmTabState extends State<FilmTab> with AutomaticKeepAliveClientMixin {
  SubordinateScrollController? scrollController;
  final bloc = getIt<FilmTabBloc>();

  @override
  void initState() {
    super.initState();

    _initController();
    bloc.add(FilmTabInitiated(
      postType: widget.postType,
      userInfo: widget.userInfo,
    ));
    _onListener();
  }

  void _onListener() {
    widget.refresh.addListener(() {
      bloc.add(FilmTabRefreshed());
    });
  }

  void _initController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final parentController = PrimaryScrollController.of(context);
      if (scrollController?.parent != parentController) {
        scrollController?.dispose();
        scrollController = SubordinateScrollController(parentController);
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<FilmTabBloc, FilmTabState>(
          buildWhen: (previous, current) =>
              previous.films != current.films ||
              previous.hasLoadMore != current.hasLoadMore ||
              previous.newFilm != current.newFilm ||
              previous.newMediaFiles != current.newMediaFiles,
          builder: (context, state) {
            final films = state.films;
            final newFilm = state.newFilm;

            if (state.isInitial()) {
              return const LoadingWidget();
            }

            if (state.isEmpty()) {
              return _buildEmptyFilms();
            }

            return scrollController == null
                ? const SizedBox.shrink()
                : SocialRefresher(
                    controller: bloc.controller,
                    scrollController: scrollController,
                    onLoading: () {
                      bloc.add(FilmTabLoadMore());
                    },
                    isRefreshing: false,
                    child: CustomScrollView(
                      shrinkWrap: true,
                      key: widget.key,
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            color: AppColors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.w),
                            child: Wrap(
                              spacing: 4.w,
                              runSpacing: 4.w,
                              children: [
                                if (newFilm != null)
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      IgnorePointer(
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            AppColors.white.withOpacity(0.4),
                                            BlendMode.hardLight,
                                          ),
                                          child: _buildFilm(
                                            newFilm,
                                            isNewFilm: true,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Đang tải...',
                                        style: context.textTheme.titleSmall!
                                            .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                if (films!.isNotEmpty)
                                  ...films.map((film) => _buildFilm(film)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }

  Container _buildEmptyFilms() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                _buildFavorited(
                  text: 'Đã lưu',
                  iconName: IconAppConstants.icSaved,
                ),
                SizedBox(width: 14.w),
                _buildFavorited(
                  text: 'Đã thích',
                  iconName: IconAppConstants.icLiked,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmptyPost(
                  postType: widget.postType,
                  hasBottomInset: false,
                ),
                const SizedBox(height: 40),
                CustomButton(
                  width: 221.w,
                  text: 'Tạo thước phim',
                  onTap: () {
                    bloc.add(CreateFilmButtonTapped());
                  },
                ),
                SizedBox(height: bottomInset + 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavorited({
    required String iconName,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.gray50,
      ),
      child: Row(
        children: [
          ImageWidget(
            iconName,
            width: 16.w,
            height: 16.w,
          ),
          SizedBox(width: 8.w),
          Text(
            text,
            style: context.text.titleSmall!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildFilm(Post film, {bool isNewFilm = false}) {
    bool hasMedia = film.getListMedia.isNotEmpty;
    if (isNewFilm) {
      hasMedia = bloc.state.newMediaFiles != null &&
          bloc.state.newMediaFiles!.isNotEmpty;
    }

    final filmWidth = 117.w;
    final filmHeight = 196.w;

    return SizedBox(
      width: filmWidth,
      height: filmHeight,
      child: Stack(
        children: [
          const LoadingWidget(),
          if (hasMedia)
            _buildShowMedia(
              film: film,
              isNewFilm: isNewFilm,
              width: filmWidth,
              height: filmHeight,
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, bottom: 20.w),
              child: Row(
                children: [
                  ImageWidget(
                    IconAppConstants.icPlay,
                    width: 10.w,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    film.getTotalReaction.stringNum,
                    style: context.text.titleSmall!
                        .copyWith(fontSize: 12, color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShowMedia({
    required bool isNewFilm,
    required Post film,
    required double width,
    required double height,
  }) {
    final medias = film.getListMedia;
    if (isNewFilm) {
      final mediaFiles = bloc.state.newMediaFiles!;

      return IgnorePointer(
        child: ThumbnailVideoPlayer(
          width: width,
          height: height,
          videoType: CustomVideoType.file,
          source: mediaFiles.first!.path,
          isShowPlay: false,
        ),
      );
    } else {
      return ThumbnailVideoPlayer(
        key: UniqueKey(),
        width: width,
        height: height,
        videoType: CustomVideoType.network,
        source: medias.first.link!,
        isShowPlay: false,
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
