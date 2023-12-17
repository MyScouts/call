// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatestVersionResponse _$LatestVersionResponseFromJson(
    Map<String, dynamic> json) {
  return _LatestVersionResponse.fromJson(json);
}

/// @nodoc
mixin _$LatestVersionResponse {
  VersionResponse? get appVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestVersionResponseCopyWith<LatestVersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestVersionResponseCopyWith<$Res> {
  factory $LatestVersionResponseCopyWith(LatestVersionResponse value,
          $Res Function(LatestVersionResponse) then) =
      _$LatestVersionResponseCopyWithImpl<$Res, LatestVersionResponse>;
  @useResult
  $Res call({VersionResponse? appVersion});

  $VersionResponseCopyWith<$Res>? get appVersion;
}

/// @nodoc
class _$LatestVersionResponseCopyWithImpl<$Res,
        $Val extends LatestVersionResponse>
    implements $LatestVersionResponseCopyWith<$Res> {
  _$LatestVersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as VersionResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VersionResponseCopyWith<$Res>? get appVersion {
    if (_value.appVersion == null) {
      return null;
    }

    return $VersionResponseCopyWith<$Res>(_value.appVersion!, (value) {
      return _then(_value.copyWith(appVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LatestVersionResponseImplCopyWith<$Res>
    implements $LatestVersionResponseCopyWith<$Res> {
  factory _$$LatestVersionResponseImplCopyWith(
          _$LatestVersionResponseImpl value,
          $Res Function(_$LatestVersionResponseImpl) then) =
      __$$LatestVersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VersionResponse? appVersion});

  @override
  $VersionResponseCopyWith<$Res>? get appVersion;
}

/// @nodoc
class __$$LatestVersionResponseImplCopyWithImpl<$Res>
    extends _$LatestVersionResponseCopyWithImpl<$Res,
        _$LatestVersionResponseImpl>
    implements _$$LatestVersionResponseImplCopyWith<$Res> {
  __$$LatestVersionResponseImplCopyWithImpl(_$LatestVersionResponseImpl _value,
      $Res Function(_$LatestVersionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = freezed,
  }) {
    return _then(_$LatestVersionResponseImpl(
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as VersionResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestVersionResponseImpl implements _LatestVersionResponse {
  const _$LatestVersionResponseImpl({this.appVersion});

  factory _$LatestVersionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestVersionResponseImplFromJson(json);

  @override
  final VersionResponse? appVersion;

  @override
  String toString() {
    return 'LatestVersionResponse(appVersion: $appVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestVersionResponseImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestVersionResponseImplCopyWith<_$LatestVersionResponseImpl>
      get copyWith => __$$LatestVersionResponseImplCopyWithImpl<
          _$LatestVersionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestVersionResponseImplToJson(
      this,
    );
  }
}

abstract class _LatestVersionResponse implements LatestVersionResponse {
  const factory _LatestVersionResponse({final VersionResponse? appVersion}) =
      _$LatestVersionResponseImpl;

  factory _LatestVersionResponse.fromJson(Map<String, dynamic> json) =
      _$LatestVersionResponseImpl.fromJson;

  @override
  VersionResponse? get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$LatestVersionResponseImplCopyWith<_$LatestVersionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) {
  return _VersionResponse.fromJson(json);
}

/// @nodoc
mixin _$VersionResponse {
  String get version => throw _privateConstructorUsedError;
  bool get force => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionResponseCopyWith<VersionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionResponseCopyWith<$Res> {
  factory $VersionResponseCopyWith(
          VersionResponse value, $Res Function(VersionResponse) then) =
      _$VersionResponseCopyWithImpl<$Res, VersionResponse>;
  @useResult
  $Res call({String version, bool force, String? note});
}

/// @nodoc
class _$VersionResponseCopyWithImpl<$Res, $Val extends VersionResponse>
    implements $VersionResponseCopyWith<$Res> {
  _$VersionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? force = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionResponseImplCopyWith<$Res>
    implements $VersionResponseCopyWith<$Res> {
  factory _$$VersionResponseImplCopyWith(_$VersionResponseImpl value,
          $Res Function(_$VersionResponseImpl) then) =
      __$$VersionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, bool force, String? note});
}

/// @nodoc
class __$$VersionResponseImplCopyWithImpl<$Res>
    extends _$VersionResponseCopyWithImpl<$Res, _$VersionResponseImpl>
    implements _$$VersionResponseImplCopyWith<$Res> {
  __$$VersionResponseImplCopyWithImpl(
      _$VersionResponseImpl _value, $Res Function(_$VersionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? force = null,
    Object? note = freezed,
  }) {
    return _then(_$VersionResponseImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VersionResponseImpl implements _VersionResponse {
  const _$VersionResponseImpl(
      {required this.version, required this.force, this.note});

  factory _$VersionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionResponseImplFromJson(json);

  @override
  final String version;
  @override
  final bool force;
  @override
  final String? note;

  @override
  String toString() {
    return 'VersionResponse(version: $version, force: $force, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionResponseImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.force, force) || other.force == force) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, force, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionResponseImplCopyWith<_$VersionResponseImpl> get copyWith =>
      __$$VersionResponseImplCopyWithImpl<_$VersionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionResponseImplToJson(
      this,
    );
  }
}

abstract class _VersionResponse implements VersionResponse {
  const factory _VersionResponse(
      {required final String version,
      required final bool force,
      final String? note}) = _$VersionResponseImpl;

  factory _VersionResponse.fromJson(Map<String, dynamic> json) =
      _$VersionResponseImpl.fromJson;

  @override
  String get version;
  @override
  bool get force;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$VersionResponseImplCopyWith<_$VersionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalSettingResponse _$GlobalSettingResponseFromJson(
    Map<String, dynamic> json) {
  return _GlobalSettingResponse.fromJson(json);
}

/// @nodoc
mixin _$GlobalSettingResponse {
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalSettingResponseCopyWith<GlobalSettingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingResponseCopyWith<$Res> {
  factory $GlobalSettingResponseCopyWith(GlobalSettingResponse value,
          $Res Function(GlobalSettingResponse) then) =
      _$GlobalSettingResponseCopyWithImpl<$Res, GlobalSettingResponse>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$GlobalSettingResponseCopyWithImpl<$Res,
        $Val extends GlobalSettingResponse>
    implements $GlobalSettingResponseCopyWith<$Res> {
  _$GlobalSettingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalSettingResponseImplCopyWith<$Res>
    implements $GlobalSettingResponseCopyWith<$Res> {
  factory _$$GlobalSettingResponseImplCopyWith(
          _$GlobalSettingResponseImpl value,
          $Res Function(_$GlobalSettingResponseImpl) then) =
      __$$GlobalSettingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$GlobalSettingResponseImplCopyWithImpl<$Res>
    extends _$GlobalSettingResponseCopyWithImpl<$Res,
        _$GlobalSettingResponseImpl>
    implements _$$GlobalSettingResponseImplCopyWith<$Res> {
  __$$GlobalSettingResponseImplCopyWithImpl(_$GlobalSettingResponseImpl _value,
      $Res Function(_$GlobalSettingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$GlobalSettingResponseImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalSettingResponseImpl implements _GlobalSettingResponse {
  const _$GlobalSettingResponseImpl({required this.value});

  factory _$GlobalSettingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalSettingResponseImplFromJson(json);

  @override
  final String value;

  @override
  String toString() {
    return 'GlobalSettingResponse(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingResponseImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingResponseImplCopyWith<_$GlobalSettingResponseImpl>
      get copyWith => __$$GlobalSettingResponseImplCopyWithImpl<
          _$GlobalSettingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalSettingResponseImplToJson(
      this,
    );
  }
}

abstract class _GlobalSettingResponse implements GlobalSettingResponse {
  const factory _GlobalSettingResponse({required final String value}) =
      _$GlobalSettingResponseImpl;

  factory _GlobalSettingResponse.fromJson(Map<String, dynamic> json) =
      _$GlobalSettingResponseImpl.fromJson;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$GlobalSettingResponseImplCopyWith<_$GlobalSettingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GlobalPersonResponse _$GlobalPersonResponseFromJson(Map<String, dynamic> json) {
  return _GlobalPersonResponse.fromJson(json);
}

/// @nodoc
mixin _$GlobalPersonResponse {
  dynamic get setting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalPersonResponseCopyWith<GlobalPersonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalPersonResponseCopyWith<$Res> {
  factory $GlobalPersonResponseCopyWith(GlobalPersonResponse value,
          $Res Function(GlobalPersonResponse) then) =
      _$GlobalPersonResponseCopyWithImpl<$Res, GlobalPersonResponse>;
  @useResult
  $Res call({dynamic setting});
}

/// @nodoc
class _$GlobalPersonResponseCopyWithImpl<$Res,
        $Val extends GlobalPersonResponse>
    implements $GlobalPersonResponseCopyWith<$Res> {
  _$GlobalPersonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setting = freezed,
  }) {
    return _then(_value.copyWith(
      setting: freezed == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalPersonResponseImplCopyWith<$Res>
    implements $GlobalPersonResponseCopyWith<$Res> {
  factory _$$GlobalPersonResponseImplCopyWith(_$GlobalPersonResponseImpl value,
          $Res Function(_$GlobalPersonResponseImpl) then) =
      __$$GlobalPersonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic setting});
}

/// @nodoc
class __$$GlobalPersonResponseImplCopyWithImpl<$Res>
    extends _$GlobalPersonResponseCopyWithImpl<$Res, _$GlobalPersonResponseImpl>
    implements _$$GlobalPersonResponseImplCopyWith<$Res> {
  __$$GlobalPersonResponseImplCopyWithImpl(_$GlobalPersonResponseImpl _value,
      $Res Function(_$GlobalPersonResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setting = freezed,
  }) {
    return _then(_$GlobalPersonResponseImpl(
      setting: freezed == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalPersonResponseImpl implements _GlobalPersonResponse {
  const _$GlobalPersonResponseImpl({required this.setting});

  factory _$GlobalPersonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalPersonResponseImplFromJson(json);

  @override
  final dynamic setting;

  @override
  String toString() {
    return 'GlobalPersonResponse(setting: $setting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalPersonResponseImpl &&
            const DeepCollectionEquality().equals(other.setting, setting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(setting));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalPersonResponseImplCopyWith<_$GlobalPersonResponseImpl>
      get copyWith =>
          __$$GlobalPersonResponseImplCopyWithImpl<_$GlobalPersonResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalPersonResponseImplToJson(
      this,
    );
  }
}

abstract class _GlobalPersonResponse implements GlobalPersonResponse {
  const factory _GlobalPersonResponse({required final dynamic setting}) =
      _$GlobalPersonResponseImpl;

  factory _GlobalPersonResponse.fromJson(Map<String, dynamic> json) =
      _$GlobalPersonResponseImpl.fromJson;

  @override
  dynamic get setting;
  @override
  @JsonKey(ignore: true)
  _$$GlobalPersonResponseImplCopyWith<_$GlobalPersonResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RenderPDFResponse _$RenderPDFResponseFromJson(Map<String, dynamic> json) {
  return _RenderPDFResponse.fromJson(json);
}

/// @nodoc
mixin _$RenderPDFResponse {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RenderPDFResponseCopyWith<RenderPDFResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RenderPDFResponseCopyWith<$Res> {
  factory $RenderPDFResponseCopyWith(
          RenderPDFResponse value, $Res Function(RenderPDFResponse) then) =
      _$RenderPDFResponseCopyWithImpl<$Res, RenderPDFResponse>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$RenderPDFResponseCopyWithImpl<$Res, $Val extends RenderPDFResponse>
    implements $RenderPDFResponseCopyWith<$Res> {
  _$RenderPDFResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RenderPDFResponseImplCopyWith<$Res>
    implements $RenderPDFResponseCopyWith<$Res> {
  factory _$$RenderPDFResponseImplCopyWith(_$RenderPDFResponseImpl value,
          $Res Function(_$RenderPDFResponseImpl) then) =
      __$$RenderPDFResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$RenderPDFResponseImplCopyWithImpl<$Res>
    extends _$RenderPDFResponseCopyWithImpl<$Res, _$RenderPDFResponseImpl>
    implements _$$RenderPDFResponseImplCopyWith<$Res> {
  __$$RenderPDFResponseImplCopyWithImpl(_$RenderPDFResponseImpl _value,
      $Res Function(_$RenderPDFResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$RenderPDFResponseImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RenderPDFResponseImpl implements _RenderPDFResponse {
  const _$RenderPDFResponseImpl({required this.url});

  factory _$RenderPDFResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RenderPDFResponseImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'RenderPDFResponse(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RenderPDFResponseImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RenderPDFResponseImplCopyWith<_$RenderPDFResponseImpl> get copyWith =>
      __$$RenderPDFResponseImplCopyWithImpl<_$RenderPDFResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RenderPDFResponseImplToJson(
      this,
    );
  }
}

abstract class _RenderPDFResponse implements RenderPDFResponse {
  const factory _RenderPDFResponse({required final String url}) =
      _$RenderPDFResponseImpl;

  factory _RenderPDFResponse.fromJson(Map<String, dynamic> json) =
      _$RenderPDFResponseImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$RenderPDFResponseImplCopyWith<_$RenderPDFResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
