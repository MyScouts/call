// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_group_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpenGroupRequestResponse _$OpenGroupRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _OpenGroupRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$OpenGroupRequestResponse {
  OpenGroupRequest? get request => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenGroupRequestResponseCopyWith<OpenGroupRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenGroupRequestResponseCopyWith<$Res> {
  factory $OpenGroupRequestResponseCopyWith(OpenGroupRequestResponse value,
          $Res Function(OpenGroupRequestResponse) then) =
      _$OpenGroupRequestResponseCopyWithImpl<$Res, OpenGroupRequestResponse>;
  @useResult
  $Res call({OpenGroupRequest? request});

  $OpenGroupRequestCopyWith<$Res>? get request;
}

/// @nodoc
class _$OpenGroupRequestResponseCopyWithImpl<$Res,
        $Val extends OpenGroupRequestResponse>
    implements $OpenGroupRequestResponseCopyWith<$Res> {
  _$OpenGroupRequestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
  }) {
    return _then(_value.copyWith(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as OpenGroupRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OpenGroupRequestCopyWith<$Res>? get request {
    if (_value.request == null) {
      return null;
    }

    return $OpenGroupRequestCopyWith<$Res>(_value.request!, (value) {
      return _then(_value.copyWith(request: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenGroupRequestResponseImplCopyWith<$Res>
    implements $OpenGroupRequestResponseCopyWith<$Res> {
  factory _$$OpenGroupRequestResponseImplCopyWith(
          _$OpenGroupRequestResponseImpl value,
          $Res Function(_$OpenGroupRequestResponseImpl) then) =
      __$$OpenGroupRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OpenGroupRequest? request});

  @override
  $OpenGroupRequestCopyWith<$Res>? get request;
}

/// @nodoc
class __$$OpenGroupRequestResponseImplCopyWithImpl<$Res>
    extends _$OpenGroupRequestResponseCopyWithImpl<$Res,
        _$OpenGroupRequestResponseImpl>
    implements _$$OpenGroupRequestResponseImplCopyWith<$Res> {
  __$$OpenGroupRequestResponseImplCopyWithImpl(
      _$OpenGroupRequestResponseImpl _value,
      $Res Function(_$OpenGroupRequestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = freezed,
  }) {
    return _then(_$OpenGroupRequestResponseImpl(
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as OpenGroupRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenGroupRequestResponseImpl implements _OpenGroupRequestResponse {
  const _$OpenGroupRequestResponseImpl({this.request});

  factory _$OpenGroupRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenGroupRequestResponseImplFromJson(json);

  @override
  final OpenGroupRequest? request;

  @override
  String toString() {
    return 'OpenGroupRequestResponse(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenGroupRequestResponseImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenGroupRequestResponseImplCopyWith<_$OpenGroupRequestResponseImpl>
      get copyWith => __$$OpenGroupRequestResponseImplCopyWithImpl<
          _$OpenGroupRequestResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenGroupRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _OpenGroupRequestResponse implements OpenGroupRequestResponse {
  const factory _OpenGroupRequestResponse({final OpenGroupRequest? request}) =
      _$OpenGroupRequestResponseImpl;

  factory _OpenGroupRequestResponse.fromJson(Map<String, dynamic> json) =
      _$OpenGroupRequestResponseImpl.fromJson;

  @override
  OpenGroupRequest? get request;
  @override
  @JsonKey(ignore: true)
  _$$OpenGroupRequestResponseImplCopyWith<_$OpenGroupRequestResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OpenGroupRequest _$OpenGroupRequestFromJson(Map<String, dynamic> json) {
  return _OpenGroupRequest.fromJson(json);
}

/// @nodoc
mixin _$OpenGroupRequest {
  int? get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenGroupRequestCopyWith<OpenGroupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenGroupRequestCopyWith<$Res> {
  factory $OpenGroupRequestCopyWith(
          OpenGroupRequest value, $Res Function(OpenGroupRequest) then) =
      _$OpenGroupRequestCopyWithImpl<$Res, OpenGroupRequest>;
  @useResult
  $Res call({int? status, DateTime? createdAt});
}

/// @nodoc
class _$OpenGroupRequestCopyWithImpl<$Res, $Val extends OpenGroupRequest>
    implements $OpenGroupRequestCopyWith<$Res> {
  _$OpenGroupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenGroupRequestImplCopyWith<$Res>
    implements $OpenGroupRequestCopyWith<$Res> {
  factory _$$OpenGroupRequestImplCopyWith(_$OpenGroupRequestImpl value,
          $Res Function(_$OpenGroupRequestImpl) then) =
      __$$OpenGroupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? status, DateTime? createdAt});
}

/// @nodoc
class __$$OpenGroupRequestImplCopyWithImpl<$Res>
    extends _$OpenGroupRequestCopyWithImpl<$Res, _$OpenGroupRequestImpl>
    implements _$$OpenGroupRequestImplCopyWith<$Res> {
  __$$OpenGroupRequestImplCopyWithImpl(_$OpenGroupRequestImpl _value,
      $Res Function(_$OpenGroupRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$OpenGroupRequestImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenGroupRequestImpl implements _OpenGroupRequest {
  const _$OpenGroupRequestImpl({this.status, this.createdAt});

  factory _$OpenGroupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenGroupRequestImplFromJson(json);

  @override
  final int? status;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OpenGroupRequest(status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenGroupRequestImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenGroupRequestImplCopyWith<_$OpenGroupRequestImpl> get copyWith =>
      __$$OpenGroupRequestImplCopyWithImpl<_$OpenGroupRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenGroupRequestImplToJson(
      this,
    );
  }
}

abstract class _OpenGroupRequest implements OpenGroupRequest {
  const factory _OpenGroupRequest(
      {final int? status, final DateTime? createdAt}) = _$OpenGroupRequestImpl;

  factory _OpenGroupRequest.fromJson(Map<String, dynamic> json) =
      _$OpenGroupRequestImpl.fromJson;

  @override
  int? get status;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OpenGroupRequestImplCopyWith<_$OpenGroupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
