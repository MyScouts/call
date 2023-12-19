import 'package:app_core/app_core.dart';
import 'package:app_main/src/app_dimens.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/media/media_file.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/common/custom_button.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_film/blocs/create_film_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/type_scope/type_scope_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/post_video_thumbnail_widget.dart';
import 'package:app_main/src/presentation/social/widgets/social_appbar_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:detectable_text_field/widgets/detectable_text_editing_controller.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui/ui.dart';

import 'blocs/create_film_event.dart';

class CreateFilmScreen extends StatefulWidget {
  static const String routeName = "create_film";

  const CreateFilmScreen({
    required this.postType,
    required this.user,
    required this.mediaFile,
    super.key,
  });
  final PostType postType;
  final User user;
  final MediaFile mediaFile;

  @override
  State<CreateFilmScreen> createState() => _CreateFilmScreenState();
}

class _CreateFilmScreenState extends State<CreateFilmScreen> {
  final bloc = getIt<CreateFilmBloc>();
  final FocusNode contentFocusNode = FocusNode();

  late DetectableTextEditingController contentController;

  @override
  void initState() {
    super.initState();
    initTextController();
    bloc.add(CreateFilmInitiated(
      mediaFile: widget.mediaFile,
      user: widget.user,
      postType: widget.postType,
    ));
  }

  void initTextController() {
    contentController = DetectableTextEditingController(
      detectedStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.blue34,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = 16.w;

    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const SocialAppBarWidget(titleText: 'Tạo thước phim'),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildMedia(),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  contentFocusNode.requestFocus();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: padding),
                                  height: 194.w,
                                  child: _buildInput(
                                    controller: contentController,
                                    text: 'Viết mô tả cho thước phim...',
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
                                    focusNode: contentFocusNode,
                                    maxLength: MyProfileConstant.contentLength,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70.w),
                  TypeScopeScreen(
                    postType: widget.postType,
                    typeScopeSelected: bloc.state.typeScopeSelected,
                    isScreen: false,
                    onChange: (typeScopeSelected) {
                      bloc.add(ScopeTypeSelected(typeScopeSelected));
                    },
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
                left: 16.w, right: 16.w, bottom: bottomInset + 12.w),
            height: 48.w,
            child: CustomButton(
              text: 'Chia sẻ',
              onTap: () {
                bloc.add(ShareButtonTapped());
              },
              isGradientColor: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMedia() {
    return IgnorePointer(
      child: PostVideoThumbnailWidget(
        width: 106.w,
        height: 194.w,
        radius: 8.r,
        child: ThumbnailVideoPlayer(
          videoType: CustomVideoType.file,
          source: widget.mediaFile.path,
        ),
      ),
    );
  }

  Widget _buildInput({
    required String text,
    required TextStyle textStyle,
    required TextStyle hintStyle,
    required Function(String) onChanged,
    required DetectableTextEditingController controller,
    int? maxLength,
    bool isShowDetectedStyle = true,
    FocusNode? focusNode,
  }) {
    const outlineBorderRadius = OutlineInputBorder(
      borderSide: BorderSide.none,
    );
    return DetectableTextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.multiline,
      style: textStyle,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
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
        counterStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey76,
        ),
      ),
      maxLength: maxLength,
      maxLines: null,
    );
  }
}
