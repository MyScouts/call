// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$ContestCopyWithImpl<$Res>;
  $Res call({int? id, int? contestId, String? name, String? status});
}

/// @nodoc
class _$ContestCopyWithImpl<$Res> implements $ContestCopyWith<$Res> {
  _$ContestCopyWithImpl(this._value, this._then);

  final Contest _value;
  // ignore: unused_field
  final $Res Function(Contest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? contestId = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contestId: contestId == freezed
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ContestCopyWith<$Res> implements $ContestCopyWith<$Res> {
  factory _$$_ContestCopyWith(
          _$_Contest value, $Res Function(_$_Contest) then) =
      __$$_ContestCopyWithImpl<$Res>;
  @override
  $Res call({int? id, int? contestId, String? name, String? status});
}

/// @nodoc
class __$$_ContestCopyWithImpl<$Res> extends _$ContestCopyWithImpl<$Res>
    implements _$$_ContestCopyWith<$Res> {
  __$$_ContestCopyWithImpl(_$_Contest _value, $Res Function(_$_Contest) _then)
      : super(_value, (v) => _then(v as _$_Contest));

  @override
  _$_Contest get _value => super._value as _$_Contest;

  @override
  $Res call({
    Object? id = freezed,
    Object? contestId = freezed,
    Object? name = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Contest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contestId: contestId == freezed
          ? _value.contestId
          : contestId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contest implements _Contest {
  const _$_Contest({this.id, this.contestId, this.name, this.status});

  factory _$_Contest.fromJson(Map<String, dynamic> json) =>
      _$$_ContestFromJson(json);

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
            other is _$_Contest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.contestId, contestId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(contestId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ContestCopyWith<_$_Contest> get copyWith =>
      __$$_ContestCopyWithImpl<_$_Contest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContestToJson(
      this,
    );
  }
}

abstract class _Contest implements Contest {
  const factory _Contest(
      {final int? id,
      final int? contestId,
      final String? name,
      final String? status}) = _$_Contest;

  factory _Contest.fromJson(Map<String, dynamic> json) = _$_Contest.fromJson;

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
  _$$_ContestCopyWith<_$_Contest> get copyWith =>
      throw _privateConstructorUsedError;
}
