import 'package:app_main/src/presentation/live/presentation/channel/live_channel_screen.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_category_picker.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_title_picker.dart';
import 'package:app_main/src/presentation/live/presentation/create/widget/live_type_picker.dart';
import 'package:flutter/material.dart';

import 'domain/entities/live_category_detail.dart';
import 'domain/entities/live_type.dart';
import 'presentation/list_gift/gift_bottom_sheet.dart';

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

  void joinLive(int liveID) {
    Navigator.of(this).pushNamed(
      LiveChannelScreen.routerName,
      arguments: liveID,
    );
  }

  void showBottomGift() {
    showModalBottomSheet(context: this, builder: (context) => const GiftCardBottomSheet());
  }
}
