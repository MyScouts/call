import 'package:dio/dio.dart';

import '../exceptions/api_exception.dart';


extension ResponseDioExt on Response {
  ApiException get apiException {
    return ApiException(
      message: data?['errorString'] ?? '',
      code: data?['code'] ?? '',
      errors: data?['statusCode'] ?? '',
    );
  }
}
