// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UpgradeAccountApi implements UpgradeAccountApi {
  _UpgradeAccountApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse<UpgradeAccountResponse>> registerJA(
      {required UpgradeJAPayload payload}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = payload;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<UpgradeAccountResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/register-community/register-ja',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<UpgradeAccountResponse>.fromJson(
      _result.data!,
      (json) => UpgradeAccountResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<dynamic>> registerJAVerifyOtp(
      {required VerifyPhoneOtpPayload payload}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = payload;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/register-community/register-ja/verify-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResponse<UpgradeAccountResponse>> resendOtpJA() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<UpgradeAccountResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/register-community/register-ja/re-send-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<UpgradeAccountResponse>.fromJson(
      _result.data!,
      (json) => UpgradeAccountResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<UpgradeAccountResponse>> resendOtpVShop() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<UpgradeAccountResponse>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/register-community/register-v-shop/re-send-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<UpgradeAccountResponse>.fromJson(
      _result.data!,
      (json) => UpgradeAccountResponse.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ApiResponse<bool>> checkIsPDone({required String id}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse<bool>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/users/check-p-done-id/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<bool>.fromJson(
      _result.data!,
      (json) => json as bool,
    );
    return value;
  }

  @override
  Future<ApiResponse<List<Bank>>> listBanks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApiResponse<List<Bank>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/master/banks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse<List<Bank>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<Bank>((i) => Bank.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
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
}
