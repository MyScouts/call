// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_team_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyTeamResponse _$MyTeamResponseFromJson(Map<String, dynamic> json) {
  return _MyTeamResponse.fromJson(json);
}

/// @nodoc
mixin _$MyTeamResponse {
  List<Team>? get teams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyTeamResponseCopyWith<MyTeamResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTeamResponseCopyWith<$Res> {
  factory $MyTeamResponseCopyWith(
          MyTeamResponse value, $Res Function(MyTeamResponse) then) =
      _$MyTeamResponseCopyWithImpl<$Res, MyTeamResponse>;
  @useResult
  $Res call({List<Team>? teams});
}

/// @nodoc
class _$MyTeamResponseCopyWithImpl<$Res, $Val extends MyTeamResponse>
    implements $MyTeamResponseCopyWith<$Res> {
  _$MyTeamResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = freezed,
  }) {
    return _then(_value.copyWith(
      teams: freezed == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTeamResponseImplCopyWith<$Res>
    implements $MyTeamResponseCopyWith<$Res> {
  factory _$$MyTeamResponseImplCopyWith(_$MyTeamResponseImpl value,
          $Res Function(_$MyTeamResponseImpl) then) =
      __$$MyTeamResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Team>? teams});
}

/// @nodoc
class __$$MyTeamResponseImplCopyWithImpl<$Res>
    extends _$MyTeamResponseCopyWithImpl<$Res, _$MyTeamResponseImpl>
    implements _$$MyTeamResponseImplCopyWith<$Res> {
  __$$MyTeamResponseImplCopyWithImpl(
      _$MyTeamResponseImpl _value, $Res Function(_$MyTeamResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = freezed,
  }) {
    return _then(_$MyTeamResponseImpl(
      teams: freezed == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTeamResponseImpl implements _MyTeamResponse {
  const _$MyTeamResponseImpl({required final List<Team>? teams})
      : _teams = teams;

  factory _$MyTeamResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTeamResponseImplFromJson(json);

  final List<Team>? _teams;
  @override
  List<Team>? get teams {
    final value = _teams;
    if (value == null) return null;
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyTeamResponse(teams: $teams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTeamResponseImpl &&
            const DeepCollectionEquality().equals(other._teams, _teams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_teams));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTeamResponseImplCopyWith<_$MyTeamResponseImpl> get copyWith =>
      __$$MyTeamResponseImplCopyWithImpl<_$MyTeamResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTeamResponseImplToJson(
      this,
    );
  }
}

abstract class _MyTeamResponse implements MyTeamResponse {
  const factory _MyTeamResponse({required final List<Team>? teams}) =
      _$MyTeamResponseImpl;

  factory _MyTeamResponse.fromJson(Map<String, dynamic> json) =
      _$MyTeamResponseImpl.fromJson;

  @override
  List<Team>? get teams;
  @override
  @JsonKey(ignore: true)
  _$$MyTeamResponseImplCopyWith<_$MyTeamResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
