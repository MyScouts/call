import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/edit_community_detail/widgets/upload_avatar_widget.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../../data/models/payloads/community/update_community_payload.dart';
import '../community_constants.dart';
import 'bloc/edit_community_detail_bloc.dart';
import 'widgets/information_image_widget.dart';
import 'widgets/information_layout_text_input_widget.dart';

class EditCommunityDetailScreen extends StatefulWidget {
  static const String routeName = '/edit-detail';

  const EditCommunityDetailScreen({
    super.key,
    required this.community,
    required this.type,
  });

  final Community community;
  final CommunityType type;

  @override
  State<EditCommunityDetailScreen> createState() =>
      _EditCommunityDetailScreenState();
}

class _EditCommunityDetailScreenState extends State<EditCommunityDetailScreen>
    with ValidationMixin {
  EditCommunityDetailBloc get editDetailBloc => context.read();

  Community get community => widget.community;

  CommunityType get type => widget.type;

  final _nameCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();

  void _onTapEditAvatar() {
    context.showUpdateAvatar().then((path) {
      if (path != null) {
        editDetailBloc.add(UserChangeAvatarEvent(localImg: path));
      }
    });
  }

  void _onTapChangeBgImage() {
    context
        .pickedFile<String?>(isImage: true, allowMultiple: false)
        .then((path) {
      if (path != null) {
        editDetailBloc.add(UserChangeBannerEvent(localImg: path));
      }
    });
  }

  void _onTapSave(Community community) {
    showLoading();

    final payload = UpdateCommunityPayload(
      name: _nameCtrl.text,
      introduction: _descriptionCtrl.text,
      avatar: community.avatar,
      banner: community.banner,
    );

    final evt = type == CommunityType.group
        ? UpdateGroupEvent(payload, community.id!)
        : UpdateTeamEvent(payload, community.id!);

    editDetailBloc.add(evt);
  }

  void _onListenerBloc(BuildContext context, EditCommunityDetailState state) {
    if (state is UpdateGroupSuccess) {
      hideLoading();
      showToastMessage('Cập nhật thông tin thành công!');
      Navigator.pop(context, state.group);
    } else if (state is UpdateTeamSuccess) {
      hideLoading();
      showToastMessage('Cập nhật thông tin thành công!');
      Navigator.pop(context, state.team);
    } else if (state is UserChangeAvatarSuccess ||
        state is UserChangeBannerSuccess) {
      checkValidation();
    }
  }

  @override
  void initState() {
    super.initState();

    _nameCtrl.text = community.name ?? '';
    _descriptionCtrl.text = community.introduction ?? '';
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin'),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: validationFormBuilder(
        child: AutoHideKeyboard(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                BlocConsumer<EditCommunityDetailBloc, EditCommunityDetailState>(
              listener: _onListenerBloc,
              builder: (context, state) {
                String? avatar = state.community.avatar;
                bool hasError = false;

                String? banner = state.community.banner;

                if (state is UserChangeBanner) {
                  banner = state.localImg;
                }

                if (state is UserChangeBannerSuccess) {
                  banner = state.newUrl.optimizeSize600;
                }

                if (state is UserChangeAvatar) {
                  avatar = state.localImg;
                }

                if (state is UserChangeAvatarSuccess) {
                  avatar = state.newUrl.optimizeSize400;
                }

                if (state is UserChangeAvatarFailure) {
                  hasError = true;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationLayoutTextInputWidget(
                      label: type.label(context),
                      hintText: type.hintText(context),
                      errMsg: type.errMsg(context),
                      controller: _nameCtrl,
                      onChanged: (String? value) {
                        checkValidation();
                      },
                    ),
                    InformationLayoutTextInputWidget(
                      label: 'Giới thiệu',
                      minLines: 7,
                      maxLines: 12,
                      hintText: type.hintIntroduction(context),
                      errMsg: 'Giới thiệu không được để trống',
                      controller: _descriptionCtrl,
                      onChanged: (String? value) {
                        checkValidation();
                      },
                    ),
                    InformationImageWidget(
                      label: 'Ảnh đại diện',
                      onTapEdit: _onTapEditAvatar,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 36),
                        child: UploadAvatarWidget(
                          urlImg: avatar,
                          hasError: hasError,
                        ),
                      ),
                    ),
                    InformationImageWidget(
                      label: 'Ảnh nền',
                      onTapEdit: _onTapChangeBgImage,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ImageWidget(banner ?? ''),
                        ),
                      ),
                    ),
                    validationListenableBuilder(builder: (isValid) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 33, bottom: 73),
                        child: PrimaryButton(
                          disabled: !(isValid &&
                              state is! UserChangeBanner &&
                              state is! UserChangeAvatar),
                          onTap: () => _onTapSave(state.community),
                          height: 45,
                          title: 'Lưu',
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    })
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
