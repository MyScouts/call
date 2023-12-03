import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/live/presentation/channel/join_channel_provider.dart';
import 'package:app_main/src/presentation/live/presentation/channel/live_channel_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_category_picker.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_title_picker.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_type_picker.dart';
import 'package:app_main/src/presentation/live/presentation/live_bottom/live_user_info_bottom_sheet.dart';
import 'package:app_main/src/presentation/live/presentation/live_tab/filter_bottom.dart';
import 'package:flutter/material.dart';

import '../social/profile/profile_bloc.dart';
import 'domain/entities/gift_card_list.dart';
import 'domain/entities/live_category_detail.dart';
import 'domain/entities/live_detail.dart';
import 'domain/entities/live_type.dart';
import 'presentation/channel/state/live_channel_controller.dart';
import 'presentation/list_gift/gift_bottom_sheet.dart';
import 'presentation/live_bottom/live_bottom_sheet.dart';
import 'presentation/live_tab/dialog.dart';
import 'presentation/live_tab/live_controller.dart';

extension LiveCoordinator on BuildContext {
  void showLiveTypePicker({
    required Function(LiveType) onChanged,
    required LiveType type,
  }) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LiveTypePicker(onChanged: onChanged, type: type),
    );
  }

  void showCategoryPicker({
    required List<LiveCategoryDetail> categories,
    required Function(List<LiveCategoryDetail> detail) onChanged,
  }) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LiveCategoryPicker(
        categories: categories,
        onChanged: onChanged,
      ),
    );
  }

  void showTitleInput({
    required Function(String) onChanged,
    required String title,
  }) {
    showDialog(
      context: this,
      builder: (_) => LiveTitlePicker(title: title, onChanged: onChanged),
    );
  }

  void showNoticeDialog({
    required String title,
  }) {
    showDialog(
      context: this,
      builder: (_) => NoticeDialog(title: title),
    );
  }

  void joinLive(int liveID) {
    Navigator.of(this).pushNamed(
      JoinChannelProvider.routerName,
      arguments: liveID,
    );
  }

  Future<GiftCard?> showBottomGift(LiveChannelController controller) {
    return showModalBottomSheet<GiftCard?>(
        context: this, isScrollControlled: true, builder: (context) => GiftCardBottomSheet(controller: controller));
  }

  void showBottomSheetLive(LiveChannelController controller, {int? index}) {
    showModalBottomSheet(
        context: this,
        isScrollControlled: true,
        builder: (context) => LiveBottomSheet(
              controller: controller,
              index: index,
            ));
  }

  Future showFilterSearchLive(LiveController controller) {
    return showModalBottomSheet(context: this, builder: (context) => FilterBottom(controller: controller));
  }

  Future<T?> startSelectUser<T>({required int userId}) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => BlocProvider<GetUserByIdBloc>(
        create: (context) => injector.get(),
        child: LiveUserInfoBottomView(userId: userId),
      ),
    );
  }
}
