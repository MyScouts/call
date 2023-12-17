// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_point_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPointResponse _$UserPointResponseFromJson(Map<String, dynamic> json) {
  return _UserPointResponse.fromJson(json);
}

/// @nodoc
mixin _$UserPointResponse {
  int? get id => throw _privateConstructorUsedError;
  int? get totalPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPointResponseCopyWith<UserPointResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPointResponseCopyWith<$Res> {
  factory $UserPointResponseCopyWith(
          UserPointResponse value, $Res Function(UserPointResponse) then) =
      _$UserPointResponseCopyWithImpl<$Res, UserPointResponse>;
  @useResult
  $Res call({int? id, int? totalPoint});
}

/// @nodoc
class _$UserPointResponseCopyWithImpl<$Res, $Val extends UserPointResponse>
    implements $UserPointResponseCopyWith<$Res> {
  _$UserPointResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPointResponseImplCopyWith<$Res>
    implements $UserPointResponseCopyWith<$Res> {
  factory _$$UserPointResponseImplCopyWith(_$UserPointResponseImpl value,
          $Res Function(_$UserPointResponseImpl) then) =
      __$$UserPointResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? totalPoint});
}

/// @nodoc
class __$$UserPointResponseImplCopyWithImpl<$Res>
    extends _$UserPointResponseCopyWithImpl<$Res, _$UserPointResponseImpl>
    implements _$$UserPointResponseImplCopyWith<$Res> {
  __$$UserPointResponseImplCopyWithImpl(_$UserPointResponseImpl _value,
      $Res Function(_$UserPointResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? totalPoint = freezed,
  }) {
    return _then(_$UserPointResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPointResponseImpl implements _UserPointResponse {
  const _$UserPointResponseImpl({this.id, this.totalPoint});

  factory _$UserPointResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPointResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final int? totalPoint;

  @override
  String toString() {
    return 'UserPointResponse(id: $id, totalPoint: $totalPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPointResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, totalPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPointResponseImplCopyWith<_$UserPointResponseImpl> get copyWith =>
      __$$UserPointResponseImplCopyWithImpl<_$UserPointResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPointResponseImplToJson(
      this,
    );
  }
}

abstract class _UserPointResponse implements UserPointResponse {
  const factory _UserPointResponse({final int? id, final int? totalPoint}) =
      _$UserPointResponseImpl;

  factory _UserPointResponse.fromJson(Map<String, dynamic> json) =
      _$UserPointResponseImpl.fromJson;

  @override
  int? get id;
  @override
  int? get totalPoint;
  @override
  @JsonKey(ignore: true)
  _$$UserPointResponseImplCopyWith<_$UserPointResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
