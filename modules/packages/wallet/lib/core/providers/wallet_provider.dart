import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../networking/interceptors/api_token_interceptor.dart';
import '../networking/interceptors/dio_curl_interceptor.dart';

class WalletProvider {
  late Dio dio;

  WalletProvider(
    String baseUrl,
    SharedPreferences sharedPreferences,
  ) {
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.add(
        ApiTokenInterceptor(sharedPreferences, onLogout: onLogout),
      );

    dio.interceptors.add(DioCurlInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  final onLogout = BehaviorSubject();
}
