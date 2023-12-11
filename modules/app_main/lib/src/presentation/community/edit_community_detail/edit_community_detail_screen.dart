import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../../data/models/payloads/community/update_community_payload.dart';
import '../community_constants.dart';
import 'bloc/edit_community_detail_bloc.dart';
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
  late String title;

  final _nameCtrl = TextEditingController();
  final _descriptionCtrl = TextEditingController();

  void _onTapEditAvatar() {
    context.showUpdateAvatar(title: "Sửa ảnh đại diện").then((path) {
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
    title = widget.type == CommunityType.group
        ? "Chỉnh sửa thông tin Group"
        : "Chỉnh sửa thông tin team";
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
        title: Text(title),
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(2),
          icon: const Icon(Icons.arrow_back),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          BlocBuilder<EditCommunityDetailBloc, EditCommunityDetailState>(
            builder: (context, state) {
              return validationListenableBuilder(builder: (isValid) {
                return TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    foregroundColor: MaterialStateProperty.all(
                        isValid ? context.theme.primaryColor : Colors.grey),
                  ),
                  onPressed: () {
                    if (!(isValid &&
                        state is! UserChangeBanner &&
                        state is! UserChangeAvatar)) {
                      return;
                    }
                    _onTapSave(state.community);
                  },
                  child: const Text("Lưu"),
                );
              });
            },
          )
        ],
      ),
      body: validationFormBuilder(
        child: AutoHideKeyboard(
          child: SingleChildScrollView(
            child:
                BlocConsumer<EditCommunityDetailBloc, EditCommunityDetailState>(
              listener: _onListenerBloc,
              builder: (context, state) {
                String? avatar = state.community.avatar;
                String? banner = state.community.banner;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: _onTapChangeBgImage,
                          child: CachedNetworkImage(
                            imageUrl: banner ?? "",
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return ImageWidget(
                                  ImageConstants.imgDefaultTeamBanner);
                            },
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _onTapEditAvatar,
                            child: Center(
                              child: AppAvatarWidget(
                                avatar: avatar,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          InformationLayoutTextInputWidget(
                            label: type.label(context),
                            hintText: type.hintText(context),
                            errMsg: type.errMsg(context),
                            controller: _nameCtrl,
                            onChanged: (String? value) => checkValidation(),
                          ),
                          InformationLayoutTextInputWidget(
                            label: 'Giới thiệu',
                            minLines: 10,
                            maxLines: 12,
                            hintText: type.hintIntroduction(context),
                            errMsg: 'Giới thiệu không được để trống',
                            controller: _descriptionCtrl,
                            onChanged: (String? value) => checkValidation(),
                          ),
                        ],
                      ),
                    ),
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
