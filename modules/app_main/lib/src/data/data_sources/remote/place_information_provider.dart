import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/networking/interceptors/api_token_interceptor.dart';


class PlaceInformationProvider {
  late Dio dio;

  PlaceInformationProvider(
    String baseUrl,
    SharedPreferences sharedPreferences,
  ) {
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors
          .add(ApiTokenInterceptor(sharedPreferences, onLogout: onLogout));
  }

  final onLogout = BehaviorSubject();

  void close() {
    onLogout.close();
  }
}
class PlaceInformationConfigurations {
  final String baseUrl;
  final bool isStudio;

  PlaceInformationConfigurations(this.baseUrl, this.isStudio);
}

@module
abstract class PlaceModule {
  @factory
  PlaceInformationProvider placeProviderProd(
          SharedPreferences sharedPreferences,
          PlaceInformationConfigurations configurations) =>
      PlaceInformationProvider(configurations.baseUrl, sharedPreferences);
}
