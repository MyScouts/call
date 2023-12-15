import 'dart:convert';

import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:flutter/material.dart';


class AppConfigService {
  static String agoraAppID = '';
  static Map<String, dynamic> ekycToken = {};

  static int timeOffset = 0;

  static Future init() async {
    final resourceUsecase = getIt<ResourceUsecase>();
    await initAgora(resourceUsecase);
    await initEkycToken(resourceUsecase);
  }

  static Future initAgora(ResourceUsecase usecase) async {
    try {
      final config = await usecase.getGlobalConfig(key: 'agoraAppId');
      AppConfigService.agoraAppID = config.value;
    } catch (e) {
      debugPrint("initEkycToken: $e");
    }
  }

  static Future initEkycToken(ResourceUsecase usecase) async {
    try {
      final ekycConfig = await usecase.getGlobalConfig(key: 'ekyc');
      String decoded = utf8.decode(base64.decode(ekycConfig.value));
      AppConfigService.ekycToken = json.decode(decoded);
    } catch (e) {
      debugPrint("initEkycToken: $e");
    }
  }
}
