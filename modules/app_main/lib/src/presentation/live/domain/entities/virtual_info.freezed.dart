// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'virtual_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VirtualInfo _$VirtualInfoFromJson(Map<String, dynamic> json) {
  return _VirtualInfo.fromJson(json);
}

/// @nodoc
mixin _$VirtualInfo {
  String? get url => throw _privateConstructorUsedError;
  double? get durationSecond => throw _privateConstructorUsedError;
  double? get startFromSecond => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VirtualInfoCopyWith<VirtualInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VirtualInfoCopyWith<$Res> {
  factory $VirtualInfoCopyWith(
          VirtualInfo value, $Res Function(VirtualInfo) then) =
      _$VirtualInfoCopyWithImpl<$Res, VirtualInfo>;
  @useResult
  $Res call({String? url, double? durationSecond, double? startFromSecond});
}

/// @nodoc
class _$VirtualInfoCopyWithImpl<$Res, $Val extends VirtualInfo>
    implements $VirtualInfoCopyWith<$Res> {
  _$VirtualInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? durationSecond = freezed,
    Object? startFromSecond = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSecond: freezed == durationSecond
          ? _value.durationSecond
          : durationSecond // ignore: cast_nullable_to_non_nullable
              as double?,
      startFromSecond: freezed == startFromSecond
          ? _value.startFromSecond
          : startFromSecond // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VirtualInfoImplCopyWith<$Res>
    implements $VirtualInfoCopyWith<$Res> {
  factory _$$VirtualInfoImplCopyWith(
          _$VirtualInfoImpl value, $Res Function(_$VirtualInfoImpl) then) =
      __$$VirtualInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, double? durationSecond, double? startFromSecond});
}

/// @nodoc
class __$$VirtualInfoImplCopyWithImpl<$Res>
    extends _$VirtualInfoCopyWithImpl<$Res, _$VirtualInfoImpl>
    implements _$$VirtualInfoImplCopyWith<$Res> {
  __$$VirtualInfoImplCopyWithImpl(
      _$VirtualInfoImpl _value, $Res Function(_$VirtualInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? durationSecond = freezed,
    Object? startFromSecond = freezed,
  }) {
    return _then(_$VirtualInfoImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSecond: freezed == durationSecond
          ? _value.durationSecond
          : durationSecond // ignore: cast_nullable_to_non_nullable
              as double?,
      startFromSecond: freezed == startFromSecond
          ? _value.startFromSecond
          : startFromSecond // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VirtualInfoImpl implements _VirtualInfo {
  const _$VirtualInfoImpl(
      {this.url, this.durationSecond, this.startFromSecond});

  factory _$VirtualInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VirtualInfoImplFromJson(json);

  @override
  final String? url;
  @override
  final double? durationSecond;
  @override
  final double? startFromSecond;

  @override
  String toString() {
    return 'VirtualInfo(url: $url, durationSecond: $durationSecond, startFromSecond: $startFromSecond)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VirtualInfoImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.durationSecond, durationSecond) ||
                other.durationSecond == durationSecond) &&
            (identical(other.startFromSecond, startFromSecond) ||
                other.startFromSecond == startFromSecond));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, durationSecond, startFromSecond);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VirtualInfoImplCopyWith<_$VirtualInfoImpl> get copyWith =>
      __$$VirtualInfoImplCopyWithImpl<_$VirtualInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VirtualInfoImplToJson(
      this,
    );
  }
}

abstract class _VirtualInfo implements VirtualInfo {
  const factory _VirtualInfo(
      {final String? url,
      final double? durationSecond,
      final double? startFromSecond}) = _$VirtualInfoImpl;

  factory _VirtualInfo.fromJson(Map<String, dynamic> json) =
      _$VirtualInfoImpl.fromJson;

  @override
  String? get url;
  @override
  double? get durationSecond;
  @override
  double? get startFromSecond;
  @override
  @JsonKey(ignore: true)
  _$$VirtualInfoImplCopyWith<_$VirtualInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
