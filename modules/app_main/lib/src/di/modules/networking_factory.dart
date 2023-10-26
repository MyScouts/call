import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
