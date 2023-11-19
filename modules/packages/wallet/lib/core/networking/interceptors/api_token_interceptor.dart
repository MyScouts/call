import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyAuthentication = 'Authorization';
const keyApiKey = 'XApiKey';
const keyBear = 'Bearer';
const keyAcceptLanguage = 'Accept-Language';
const _assessToken = '_assessToken';
const _refreshToken = '_refreshToken';

class ApiTokenInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;
  final BehaviorSubject onLogout;

  ApiTokenInterceptor(this._sharedPreferences, {required this.onLogout});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _sharedPreferences.getString(_assessToken);
    if (accessToken?.isNotEmpty ?? false) {
      print('accessToken: $accessToken');
      options.headers[keyAuthentication] = '$keyBear $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log('[Dio][ApiTokenInterceptor] error ${err.response}');
    }
    final errorCode = err.response?.data?['statusCode'];
    if ('401' == '$errorCode' || 401 == err.response?.statusCode) {
      onLogout.sink.add(null);
    }

    super.onError(err, handler);
  }
}
