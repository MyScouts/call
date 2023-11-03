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
  void pop() => Navigator.of(this).pop();

  void startSelectedBottomBarItem(int index) {
    this.read<AppSettingBloc>().add(BottomBarItemSelected(index));
  }

  Future<T?> startDashboard<T>() {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(DashboardScreen.routeName, (route) => false);
  }

  // Future<T?> startPDoneTab<T>() {
  //   final currentName = ModalRoute.of(this)?.settings.name;
  //   if (currentName != DashboardScreen.routeName) {
  //     startDashboard();
  //   }
  //
  //   startSelectedBottomBarItem(DashboardBottomNavigationBarItem.pdone.index);
  //   return Future.value(null);
  // }

  // Future<T?> startVshopWithIdFullScreen<T>(int? id) {
  //   return startVshopDetailById(id: id, showAppbar: true);
  // }

  // void startVshopWithId<T>(int? id) {
  //   this.read<AppSettingBloc>().add(BottomBarItemSelected(
  //           DashboardBottomNavigationBarItem.explore.index, handler: () {
  //         AppCoordinator.exploreKey.currentContext
  //             ?.startVshopDetailById(id: id);
  //       }));
  // }

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
