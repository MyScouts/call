import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:easy_device_media/device_media.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui/ui.dart';
import 'dashboard/dashboard/dashboard_screen.dart';
import 'shared/app_setting/bloc/app_setting_bloc.dart';

extension AppMainCoordinator on BuildContext {
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

  void pop({dynamic data}) => Navigator.of(this).pop(data);

  void startSelectedBottomBarItem(int index) {
    read<AppSettingBloc>().add(BottomBarItemSelected(index));
  }

  Future<T?> startDashboard<T>() {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(DashBoardScreen.routeName, (route) => false);
  }

  Future<bool?> checkAndRequestPermissionPhoto() async {
    final status = await Permission.photos.status;
    if (status.isRestricted) {
      final statusRequest = await Permission.photos.request();
      if (statusRequest == PermissionStatus.denied) {
        return false;
      }
    }

    if (status.isDenied) {
      return showDialogRequestPermission(
        'Cho phép truy cập ảnh',
        'Hãy đi đến phần Cài đặt & cho phép truy cập Ảnh',
      );
    }

    return true;
  }

  Future<bool?> checkAndRequestPermissionCamera() async {
    final status = await Permission.camera.status;

    if (status.isRestricted) {
      final statusRequest = await Permission.camera.request();
      if (statusRequest == PermissionStatus.denied) {
        return false;
      }
    }

    if (status.isDenied) {
      final statusRequest = await Permission.camera.request();
      if (statusRequest == PermissionStatus.denied) {
        return showDialogRequestPermission(
          'Cho phép truy cập Camera',
          'Hãy đi đến phần Cài đặt & cho phép truy cập Camera',
        );
      }
    }

    return true;
  }

  Future<bool> showDialogRequestPermission<T>(String title, String content) {
    return showDialog(
      context: this,
      builder: (ctx) =>
          RequestPermissionDialogWidget(content: content, title: title),
    ).then((success) {
      if (success is bool && success) {
        return openAppSettings();
      }
      return false;
    });
  }

  Future<T?> takePhoto<T>({bool needCrop = false}) async {
    if (kDebugMode) {
      return pickedImage<T?>(DeviceMediaSource.gallery, needCrop: needCrop);
    }
    return pickedImage<T?>(DeviceMediaSource.camera, needCrop: needCrop);
  }
}
