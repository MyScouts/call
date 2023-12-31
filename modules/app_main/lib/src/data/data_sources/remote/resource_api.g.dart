// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ResourceApi implements ResourceApi {
  _ResourceApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<List<MediaModel>>> getMedias({
    required String role,
    required String type,
    required String category,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<MediaModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/medias/${role}?category=${category}&type=${type}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<MediaModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<MediaModel>(
                  (i) => MediaModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<LatestVersionResponse> latestVersion({required String type}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LatestVersionResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/v1/app-version/type/${type}/latest',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = LatestVersionResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GlobalSettingResponse> getGlobalSetting(String key) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GlobalSettingResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/v1/setting/${key}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GlobalSettingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GlobalPersonResponse> getGlobalPeronSetting(int userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GlobalPersonResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/v1/setting/personal/user/${userId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GlobalPersonResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RenderPDFResponse> renderPDF(dynamic payload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = payload;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RenderPDFResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/v1/render-pdf',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = RenderPDFResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<String> storageUploadUrl(XFile file, String prefix) async {
    final resource = '$prefix${file.name}';
    final _responseGetUrlUpload = StorageUploadUrlResponse.fromJson(
        (await _dio.get('api/v1/storage/upload-url?filepath=${resource}'))
            .data);
    Uint8List imageData = await File(file.path).readAsBytes();
    await Dio().request(
      _responseGetUrlUpload.uploadUrl,
      options: Options(
        method: 'PUT',
        headers: {'Content-Type': 'image/jpeg'},
      ),
      data: imageData,
    );
    return _responseGetUrlUpload.publicUrl;
  }
}
