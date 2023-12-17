import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:easy_device_media/device_media.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../button/widgets/circle_image_widget.dart';
import 'picked_file.dart';

extension DeviceImageExtension on BuildContext {
  Future<T?> pickedImage<T>(
    DeviceMediaSource source, {
    CropType cropType = CropType.circle,
    bool needCrop = false,
  }) async {
    return await DeviceMediaServiceImpl().openPickImage(
      source,
      needCompress: true,
      cropType: cropType,
      needCrop: needCrop,
    ) as T?;
  }

  Future<T?> pickPhoto<T>() async {
    return pickedImage<T?>(DeviceMediaSource.gallery);
  }

  Future<T?> takePhoto<T>({bool needCrop = false}) async {
    if (kDebugMode) {
      return pickedImage<T?>(DeviceMediaSource.gallery, needCrop: needCrop);
    }
    return pickedImage<T?>(DeviceMediaSource.camera, needCrop: needCrop);
  }

  Future<T?> showUpdateCover<T>({String? title}) async {
    return showModelUpdatePhoto<T?>(CropType.rectangle, title: title);
  }

  Future<T?> showUpdateAvatar<T>({String? title}) async {
    return showModelUpdatePhoto<T?>(CropType.circle, title: title);
  }

  Future<T?> showModelUpdatePhoto<T>(
    CropType type, {
    bool useCrop = true,
    String? title,
  }) async {
    return showModalBottomSheet<T?>(
      context: this,
      barrierColor: Colors.black26,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CloseButton(),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        title,
                        style: context.textTheme.titleMedium,
                      )),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                if (title != null) const Divider(),
                ListTile(
                  onTap: () {
                    pickedImage(DeviceMediaSource.camera, needCrop: useCrop)
                        .then((value) => Navigator.of(context).pop(value));
                  },
                  leading: const Icon(Icons.photo_camera_outlined),
                  title: Text(S.of(context).lbl_Camera),
                  minLeadingWidth: 0,
                ),
                ListTile(
                  onTap: () {
                    pickedImage(
                      DeviceMediaSource.gallery,
                      needCrop: useCrop,
                      cropType: type,
                    ).then((value) => Navigator.of(context).pop(value));
                  },
                  leading: const Icon(Icons.photo_outlined),
                  title: Text(S.of(context).lbl_Gallery),
                  minLeadingWidth: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void pickFile({
    bool isImage = false,
    bool allowMultiple = false,
    required int id,
  }) {
    if (allowMultiple) {
      pickedFile<List<String?>>(allowMultiple: allowMultiple, isImage: isImage)
          .then((value) => Navigator.of(this).pop([value, id]));
    } else {
      pickedFile<String>(allowMultiple: allowMultiple, isImage: isImage)
          .then((value) => Navigator.of(this).pop([value, id]));
    }
  }

  Future<T?> startPickFile<T>({
    bool isImage = false,
    bool allowMultiple = false,
    required int id,
  }) async {
    final value = await pickedFile<String>(
        allowMultiple: allowMultiple, isImage: isImage);
    return [value, id] as T?;
  }

  Future<T?> showModelSelectAttachment<T>(
      {bool allowMultiple = false,
      bool isImage = false,
      bool showFile = false}) async {
    return showModalBottomSheet<T?>(
      context: this,
      barrierColor: Colors.black26,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickMedia()
                        .then((value) => Navigator.of(context).pop([value, 0]));

                    // _pickFile(
                    //   context,
                    //   id: 0,
                    //   allowMultiple: allowMultiple,
                    //   isImage: true,
                    // );
                  },
                  leading: const Icon(Icons.photo_outlined),
                  title: Text(S.of(context).lbl_Gallery),
                  minLeadingWidth: 0,
                ),
                ListTile(
                  onTap: () {
                    pickedImage(DeviceMediaSource.camera, needCrop: false)
                        .then((value) => Navigator.of(context).pop([value, 1]));
                  },
                  leading: const Icon(Icons.photo_camera_outlined),
                  title: Text(S.of(context).lbl_Camera),
                  minLeadingWidth: 0,
                ),
                if (showFile)
                  ListTile(
                    onTap: () {
                      pickFile(
                        id: 2,
                        allowMultiple: allowMultiple,
                        isImage: false,
                      );
                    },
                    leading: const Icon(Icons.file_copy_rounded),
                    title: Text(S.of(context).lbl_File),
                    minLeadingWidth: 0,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<T?> showChooseQrCode<T>() async {
    return showDialogPick<T?>(CropType.rectangle);
  }

  Future<T?> showDialogPick<T>(CropType type, {bool useCrop = true}) async {
    return showDialog<T?>(
      context: this,
      barrierColor: Colors.black26,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(this),
                    child: const Icon(Icons.close, color: AppColors.black10),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.blue10, width: 3),
                    ),
                  ),
                  child: Text(
                    'Ảnh mã QR',
                    style: text.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    pickedImage(DeviceMediaSource.camera, needCrop: useCrop)
                        .then(
                      (value) => Navigator.of(this).pop(value),
                    );
                  },
                  leading:
                      CircleImageWidget(IconAppConstants.camera2, radius: 22),
                  title: const Text('Sử dụng camera'),
                  horizontalTitleGap: 10,
                  contentPadding: EdgeInsets.zero,
                ),
                ListTile(
                  onTap: () {
                    pickedImage(
                      DeviceMediaSource.gallery,
                      needCrop: useCrop,
                      cropType: type,
                    ).then((value) => Navigator.of(this).pop(value));
                  },
                  leading:
                      CircleImageWidget(IconAppConstants.gallery, radius: 22),
                  title: const Text('Chọn ảnh từ thư viện'),
                  horizontalTitleGap: 10,
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
