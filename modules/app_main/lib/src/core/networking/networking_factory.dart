import 'package:app_main/src/core/networking/interceptors/api_token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interceptors/dio_curl_interceptor.dart';

class RequestHeaders {
  static const String applicationJson = "application/json";
  static const String contentType = "Content-Type";
  static const String accept = "Accept";
  static const String authorization = "Authorization";
  static const String defaultLanguage = "language";
  static const String acceptLanguage = "Accept-Language";
  static const String securedKey = 'secured';
}

Map<String, String> headers = {
  // RequestHeaders.contentType: RequestHeaders.applicationJson,
  // RequestHeaders.accept: RequestHeaders.applicationJson,
};

class NetworkingFactory {
  static Dio createDio(String baseUrl, SharedPreferences sharedPreferences,
      BehaviorSubject onLogout,
      [bool isDebug = false]) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ));

    dio.interceptors.add(
      ApiTokenInterceptor(sharedPreferences, onLogout: onLogout),
    );
    dio.interceptors.add(DioCurlInterceptor(onLogout: onLogout));
    if (isDebug) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
