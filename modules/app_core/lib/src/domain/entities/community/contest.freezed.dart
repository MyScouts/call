// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contest _$ContestFromJson(Map<String, dynamic> json) {
  return _Contest.fromJson(json);
}

/// @nodoc
mixin _$Contest {
  int? get id => throw _privateConstructorUsedError;
  int? get contestId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContestCopyWith<Contest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContestCopyWith<$Res> {
  factory $ContestCopyWith(Contest value, $Res Function(Contest) then) =
      _$ContestCopyWithImpl<$Res, Contest>;
  @useResult
  $Res call({int? id, int? contestId, String? name, String? status});
}

/// @nodoc
class _$ContestCopyWithImpl<$Res, $Val extends Contest>
    implements $ContestCopyWith<$Res> {
  _$ContestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contestId = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contestId: freezed == contestId
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContestImplCopyWith<$Res> implements $ContestCopyWith<$Res> {
  factory _$$ContestImplCopyWith(
          _$ContestImpl value, $Res Function(_$ContestImpl) then) =
      __$$ContestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? contestId, String? name, String? status});
}

/// @nodoc
class __$$ContestImplCopyWithImpl<$Res>
    extends _$ContestCopyWithImpl<$Res, _$ContestImpl>
    implements _$$ContestImplCopyWith<$Res> {
  __$$ContestImplCopyWithImpl(
      _$ContestImpl _value, $Res Function(_$ContestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contestId = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_$ContestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contestId: freezed == contestId
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContestImpl implements _Contest {
  const _$ContestImpl({this.id, this.contestId, this.name, this.status});

  factory _$ContestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContestImplFromJson(json);

  @override
  final int? id;
  @override
  final int? contestId;
  @override
  final String? name;
  @override
  final String? status;

  @override
  String toString() {
    return 'Contest(id: $id, contestId: $contestId, name: $name, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contestId, contestId) ||
                other.contestId == contestId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, contestId, name, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContestImplCopyWith<_$ContestImpl> get copyWith =>
      __$$ContestImplCopyWithImpl<_$ContestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContestImplToJson(
      this,
    );
  }
}

abstract class _Contest implements Contest {
  const factory _Contest(
      {final int? id,
      final int? contestId,
      final String? name,
      final String? status}) = _$ContestImpl;

  factory _Contest.fromJson(Map<String, dynamic> json) = _$ContestImpl.fromJson;

  @override
  int? get id;
  @override
  int? get contestId;
  @override
  String? get name;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$ContestImplCopyWith<_$ContestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
