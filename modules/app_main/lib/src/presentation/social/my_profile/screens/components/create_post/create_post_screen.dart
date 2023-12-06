import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/app_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/blocs/create_post_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/blocs/create_post_event.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/blocs/create_post_state.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/multiple_image.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:design_system/design_system.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class CreatePostScreen extends StatefulWidget {
  static const String routeName = "create_post";

  const CreatePostScreen({
    required this.postType,
    required this.user,
    this.isShowMedia = false,
    super.key,
  });
  final PostType postType;
  final User? user;
  final bool isShowMedia;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final bloc = getIt<CreatePostBloc>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isShowMedia) {
      bloc.add(MediaTapped(widget.postType));
    }
  }

  @override
  Widget build(BuildContext context) {
    const avatarSize = 52.0;
    const maxLinesSubject = 10;
    const minLinesSubject = 3;
    final keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    const padding = 16.0;

    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(),
          body: Container(
              padding: const EdgeInsets.symmetric(vertical: padding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: avatarSize,
                                height: avatarSize,
                                child: CircleAvatar(
                                  radius: avatarSize,
                                  child: ClipOval(
                                    child: ImageWidget(
                                      widget.user?.getUserAvatar ??
                                          ImageConstants.defaultUserAvatar,
                                      width: avatarSize,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.user?.getdisplayName ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  _buildTypeScope(),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _buildInput(
                            text: 'Viết một dòng mở đầu',
                            onChanged: (text) =>
                                bloc.add(SubjectTextFieldChanged(text)),
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey76,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            minLines: minLinesSubject,
                            maxLines: maxLinesSubject,
                            isShowDetectedStyle: false,
                          ),
                          const SizedBox(height: 6),
                          _buildInput(
                            text: 'Bạn đang nghĩ gì ?',
                            onChanged: (text) =>
                                bloc.add(ContentTextFieldChanged(text)),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey76,
                            ),
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildMedia(),
                  ],
                ),
              )),
          bottomSheet: BlocBuilder<CreatePostBloc, CreatePostState>(
              buildWhen: (previous, current) => previous.files != current.files,
              builder: (context, state) {
                bool isShowKeyBoard = keyBoardHeight != 0;
                bool isFilesEmpty = state.files.isEmpty;
                bool isVerticleAction = !isShowKeyBoard && isFilesEmpty;
                double paddingBottom = isVerticleAction
                    ? keyBoardHeight
                    : (isShowKeyBoard ? keyBoardHeight : 32);

                return Container(
                  padding: EdgeInsets.only(bottom: paddingBottom),
                  color: AppColors.white,
                  child: isVerticleAction
                      ? _buildVerticleAction()
                      : _buildHorizontalAction(),
                );
              }),
        ),
      ),
    );
  }

  Widget _buildMedia() {
    return BlocBuilder<CreatePostBloc, CreatePostState>(
      buildWhen: (previous, current) => previous.files != current.files,
      builder: (context, state) {
        if (state.files.isEmpty) return const SizedBox.shrink();
        return Column(
          children: [
            if (state.files.isNotEmpty)
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 2),
                child: InkWell(
                  onTap: () => bloc.add(RemoveMediaTapped()),
                  child: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            widget.postType.isVideo
                ? SizedBox(
                    width: double.infinity,
                    child: CommonVideoPlayer(
                      videoType: VideoType.file,
                      source: state.files.first!.path,
                    ),
                  )
                : CommonMultiImageView.multiFile(
                    width: double.infinity,
                    listFile: state.files.map((e) => e!.path).toList(),
                  ),
          ],
        );
      },
    );
  }

  Widget _buildHorizontalAction() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHorizontalFirstAction(),
          ImageWidget(IconAppConstants.icSmileBg, width: 36, height: 36),
          ImageWidget(IconAppConstants.icPositionBg, width: 36, height: 36),
          ImageWidget(IconAppConstants.icTagBg, width: 36, height: 36),
        ],
      ),
    );
  }

  Widget _buildHorizontalFirstAction() {
    var iconName = IconAppConstants.icGalleryBg;
    if (widget.postType.isVideo) {
      iconName = IconAppConstants.icVideoBg;
    }

    return ImageWidget(iconName, width: 36, height: 36);
  }

  Widget _buildVerticleAction() {
    final paddingBottom = MediaQuery.viewPaddingOf(context).bottom;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            'Thêm vào bài viết của bạn',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey76,
            ),
          ),
          _buildFirstAction(),
          _buildAction(
            iconName: IconAppConstants.icSmileBg,
            text: 'Cảm xúc',
          ),
          _buildAction(
            iconName: IconAppConstants.icPositionBg,
            text: 'Checkin',
          ),
          _buildAction(
            iconName: IconAppConstants.icTagBg,
            text: 'Gắn thẻ',
            isShowDivider: false,
          ),
          SizedBox(height: paddingBottom),
        ],
      ),
    );
  }

  Widget _buildFirstAction() {
    if (widget.postType.isText) {
      return _buildAction(
        iconName: IconAppConstants.icGalleryBg,
        text: 'Ảnh',
        onTap: () => bloc.add(MediaTapped(widget.postType)),
      );
    }

    if (widget.postType.isVideo) {
      return _buildAction(
        iconName: IconAppConstants.icVideoBg,
        text: 'Video',
        onTap: () => bloc.add(MediaTapped(widget.postType)),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildAction({
    required String iconName,
    required String text,
    Function()? onTap,
    bool isShowDivider = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 47,
            child: Row(
              children: [
                ImageWidget(iconName, width: 24, height: 24),
                const SizedBox(width: 12),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (isShowDivider) const Divider(),
        ],
      ),
    );
  }

  Widget _buildTypeScope() {
    return BlocBuilder<CreatePostBloc, CreatePostState>(
        buildWhen: (previous, current) =>
            previous.typeScopeSelected != current.typeScopeSelected,
        builder: (context, state) {
          return InkWell(
            onTap: () async {
              final data = await context.startTypeScope(
                  postType: widget.postType,
                  typeScopeSelected: state.typeScopeSelected);

              if (data != null) {
                bloc.add(ScopeTypeSelected(data as ScopeType));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.grey77,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageWidget(
                    state.typeScopeSelected.iconName,
                    width: 15,
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      state.typeScopeSelected.text,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey76,
                        height: 1,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 16,
                    color: AppColors.grey76,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildInput({
    required String text,
    required TextStyle textStyle,
    required TextStyle hintStyle,
    required Function(String) onChanged,
    int? maxLines,
    int? minLines,
    bool isShowDetectedStyle = true,
  }) {
    const outlineBorderRadius = OutlineInputBorder(
      borderSide: BorderSide.none,
    );

    return DetectableTextField(
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      minLines: minLines,
      style: textStyle,
      onChanged: onChanged,
      detectedStyle: isShowDetectedStyle ?  const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.blue34,
      ) : textStyle,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: text,
        focusedBorder: outlineBorderRadius,
        enabledBorder: outlineBorderRadius,
        errorBorder: outlineBorderRadius,
        disabledBorder: outlineBorderRadius,
        border: outlineBorderRadius,
        hintStyle: hintStyle,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          const Text(
            'Tạo bài viết',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<CreatePostBloc, CreatePostState>(
              builder: (context, state) {
            return InkWell(
              onTap: () {
                if (state.isShowPostButton) {
                  final createPostPayload = CreatePostPayload(
                    scopeType: state.typeScopeSelected,
                    subject: state.subject,
                    content: state.content,
                    postType: widget.postType,
                    mediaFiles: state.files,
                  );
                  context.pop(data: createPostPayload);
                }
              },
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                    color: state.isShowPostButton
                        ? AppColors.blueEdit
                        : AppColors.grey81,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Đăng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: state.isShowPostButton
                        ? AppColors.white
                        : AppColors.grey82,
                  ),
                ),
              ),
            );
          })
        ],
      ),
      centerTitle: true,
      elevation: 0,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
    );
  }
}
