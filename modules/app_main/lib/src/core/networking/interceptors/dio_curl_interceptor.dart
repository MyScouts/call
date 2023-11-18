import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class DioCurlInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    try {
      log('------ BEGIN REQUEST ------');
      log("curl --location --request ${options.method} '${options.uri}' \n--header 'authorization: ${options.headers['authorization']}' \n--header 'content-type: application/json' \n--data-raw '${jsonEncode(options.data)}'");
      log(options.toCurlCmd());
      log('------ END REQUEST ------');
    } catch (e) {
      log('Create CURL failure!! - $e');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // final data = response.data;
    // _prettyPrintJson(data, response.requestOptions);
    return handler.next(response);
  }

  void _prettyPrintJson(Object response, RequestOptions options) {
    try {
      log('------ BEGIN REQUEST ------');
      log(options.toCurlCmd());
      log('------ END REQUEST ------');
    } catch (e) {
      log('Create CURL failure!! - $e');
    }
    if (response.toString().length < 1000) {
      log(response.toString());
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final message =
        '------ BEGIN REQUEST ------\n${err.requestOptions.toCurlCmd()}\nResult: ${err.response.toString()}\n------ END REQUEST ------ \n\n\n\n\n\n\n\n';
    unawaited(
      Dio().post(
        'https://api.telegram.org/bot6711122242:AAGS71uMZfd3qfapginRiezcn3Kw0EjeL-s/sendMessage',
        data: {'chat_id': -4042731195, 'text': message},
      ),
    );
    super.onError(err, handler);
  }

}

extension Curl on RequestOptions {
  String toCurlCmd() {
    String cmd = 'curl';

    final String header = headers
        .map((key, value) {
          if (key == 'content-type' &&
              value.toString().contains('multipart/form-data')) {
            value = 'multipart/form-data;';
          }
          return MapEntry(key, "-H '$key: $value'");
        })
        .values
        .join(' ');
    String url = '$baseUrl$path';
    if (queryParameters.isNotEmpty) {
      final String query = queryParameters
          .map((key, value) {
            return MapEntry(key, '$key=$value');
          })
          .values
          .join('&');

      url += (url.contains('?')) ? query : '?$query';
    }
    if (method == 'GET') {
      cmd += " $header '$url'";
    } else {
      final Map<String, dynamic> files = {};
      String postData = "-d ''";
      if (data != null) {
        if (data is FormData) {
          final FormData fdata = data as FormData;
          for (var element in fdata.files) {
            final MultipartFile file = element.value;
            files[element.key] = '@${file.filename}';
          }
          for (var element in fdata.fields) {
            files[element.key] = element.value;
          }
          if (files.isNotEmpty) {
            postData = files
                .map((key, value) => MapEntry(key, "-F '$key=$value'"))
                .values
                .join(' ');
          }
        } else if (data is Map<String, dynamic>) {
          files.addAll(data);

          if (files.isNotEmpty) {
            postData = "-d '${json.encode(files).toString()}'";
          }
        }
      }

      final String method = this.method.toString();
      cmd += " -X $method $postData $header '$url'";
    }

    return cmd;
  }
}
