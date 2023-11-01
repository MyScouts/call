import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/presentation/community/edit_community_detail/widgets/upload_avatar_widget.dart';
import 'package:app_main/src/presentation/marshop/widgets/gradiant_button.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../../domain/entities/community/update_community_payload.dart';
import '../community_constants.dart';
import '../edit_community_detail/widgets/information_image_widget.dart';
import '../edit_community_detail/widgets/information_layout_text_input_widget.dart';
import 'bloc/edit_fan_group_bloc.dart';

class EditFanGroupScreen extends StatefulWidget {
  static const String routeName = '/edit-fan-group';

  const EditFanGroupScreen({super.key, required this.fanGroup});

  final FanGroup fanGroup;

  @override
  State<EditFanGroupScreen> createState() => _EditFanGroupScreenState();
}

class _EditFanGroupScreenState extends State<EditFanGroupScreen>
    with ValidationMixin {
  FanGroup get fanGroup => widget.fanGroup;
  final type = CommunityType.group;
  EditFanGroupBloc get editDetailBloc => context.read();

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

  void _onListenerBloc(BuildContext context, EditFanGroupState state) {
    if (state is UpdateFanGroupSuccess) {
      hideLoading();
      showToastMessage('Cập nhật thông tin thành công!');
      Navigator.pop(context, true);
    } else if (state is UserChangeAvatarSuccess ||
        state is UserChangeBannerSuccess) {
      checkValidation();
    } else if (state is UpdateInformationFailure) {
      hideLoading();
      final e = state.err;
      if (e is DioError) {
        final message = e.toMessage(context);
        showToastMessage(message, ToastMessageType.error);
      } else {
        showToastMessage(
            'Cập nhật thông tin không thành công!', ToastMessageType.error);
      }
    }
  }

  void _onTapSave(FanGroup fanGroup) {
    showLoading();

    final payload = UpdateCommunityPayload(
      name: _nameCtrl.text,
      introduction: _descriptionCtrl.text,
      avatar: fanGroup.avatar,
      banner: fanGroup.banner,
    );

    editDetailBloc.add(UpdateFanGroupEvent(payload, fanGroup.id!));
  }

  @override
  void initState() {
    super.initState();

    _nameCtrl.text = fanGroup.name ?? '';
    _descriptionCtrl.text = fanGroup.introduction ?? '';
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
            child: BlocConsumer<EditFanGroupBloc, EditFanGroupState>(
              listener: _onListenerBloc,
              builder: (context, state) {
                String? avatar = state.fanGroup.avatar;
                bool hasError = false;

                String? banner = state.fanGroup.banner;

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
                        child: GradiantButton(
                          onPressed: isValid &&
                                  state is! UserChangeBanner &&
                                  state is! UserChangeAvatar
                              ? () => _onTapSave(state.fanGroup)
                              : null,
                          height: 45,
                          child: Text(
                            'Lưu',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.white),
                          ),
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
