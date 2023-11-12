// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_join_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberJoinRequestResponse _$MemberJoinRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _MemberJoinRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$MemberJoinRequestResponse {
  List<RequestDetail> get requests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberJoinRequestResponseCopyWith<MemberJoinRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberJoinRequestResponseCopyWith<$Res> {
  factory $MemberJoinRequestResponseCopyWith(MemberJoinRequestResponse value,
          $Res Function(MemberJoinRequestResponse) then) =
      _$MemberJoinRequestResponseCopyWithImpl<$Res, MemberJoinRequestResponse>;
  @useResult
  $Res call({List<RequestDetail> requests});
}

/// @nodoc
class _$MemberJoinRequestResponseCopyWithImpl<$Res,
        $Val extends MemberJoinRequestResponse>
    implements $MemberJoinRequestResponseCopyWith<$Res> {
  _$MemberJoinRequestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = null,
  }) {
    return _then(_value.copyWith(
      requests: null == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberJoinRequestResponseImplCopyWith<$Res>
    implements $MemberJoinRequestResponseCopyWith<$Res> {
  factory _$$MemberJoinRequestResponseImplCopyWith(
          _$MemberJoinRequestResponseImpl value,
          $Res Function(_$MemberJoinRequestResponseImpl) then) =
      __$$MemberJoinRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RequestDetail> requests});
}

/// @nodoc
class __$$MemberJoinRequestResponseImplCopyWithImpl<$Res>
    extends _$MemberJoinRequestResponseCopyWithImpl<$Res,
        _$MemberJoinRequestResponseImpl>
    implements _$$MemberJoinRequestResponseImplCopyWith<$Res> {
  __$$MemberJoinRequestResponseImplCopyWithImpl(
      _$MemberJoinRequestResponseImpl _value,
      $Res Function(_$MemberJoinRequestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = null,
  }) {
    return _then(_$MemberJoinRequestResponseImpl(
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberJoinRequestResponseImpl implements _MemberJoinRequestResponse {
  const _$MemberJoinRequestResponseImpl(
      {required final List<RequestDetail> requests})
      : _requests = requests;

  factory _$MemberJoinRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberJoinRequestResponseImplFromJson(json);

  final List<RequestDetail> _requests;
  @override
  List<RequestDetail> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  @override
  String toString() {
    return 'MemberJoinRequestResponse(requests: $requests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberJoinRequestResponseImpl &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_requests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberJoinRequestResponseImplCopyWith<_$MemberJoinRequestResponseImpl>
      get copyWith => __$$MemberJoinRequestResponseImplCopyWithImpl<
          _$MemberJoinRequestResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberJoinRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _MemberJoinRequestResponse implements MemberJoinRequestResponse {
  const factory _MemberJoinRequestResponse(
          {required final List<RequestDetail> requests}) =
      _$MemberJoinRequestResponseImpl;

  factory _MemberJoinRequestResponse.fromJson(Map<String, dynamic> json) =
      _$MemberJoinRequestResponseImpl.fromJson;

  @override
  List<RequestDetail> get requests;
  @override
  @JsonKey(ignore: true)
  _$$MemberJoinRequestResponseImplCopyWith<_$MemberJoinRequestResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestDetail _$RequestDetailFromJson(Map<String, dynamic> json) {
  return _RequestDetail.fromJson(json);
}

/// @nodoc
mixin _$RequestDetail {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestDetailCopyWith<RequestDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestDetailCopyWith<$Res> {
  factory $RequestDetailCopyWith(
          RequestDetail value, $Res Function(RequestDetail) then) =
      _$RequestDetailCopyWithImpl<$Res, RequestDetail>;
  @useResult
  $Res call({DateTime? createdAt, User? user, Team team});

  $UserCopyWith<$Res>? get user;
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$RequestDetailCopyWithImpl<$Res, $Val extends RequestDetail>
    implements $RequestDetailCopyWith<$Res> {
  _$RequestDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? user = freezed,
    Object? team = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestDetailImplCopyWith<$Res>
    implements $RequestDetailCopyWith<$Res> {
  factory _$$RequestDetailImplCopyWith(
          _$RequestDetailImpl value, $Res Function(_$RequestDetailImpl) then) =
      __$$RequestDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? createdAt, User? user, Team team});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$RequestDetailImplCopyWithImpl<$Res>
    extends _$RequestDetailCopyWithImpl<$Res, _$RequestDetailImpl>
    implements _$$RequestDetailImplCopyWith<$Res> {
  __$$RequestDetailImplCopyWithImpl(
      _$RequestDetailImpl _value, $Res Function(_$RequestDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? user = freezed,
    Object? team = null,
  }) {
    return _then(_$RequestDetailImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestDetailImpl implements _RequestDetail {
  const _$RequestDetailImpl(
      {required this.createdAt, required this.user, required this.team});

  factory _$RequestDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestDetailImplFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final User? user;
  @override
  final Team team;

  @override
  String toString() {
    return 'RequestDetail(createdAt: $createdAt, user: $user, team: $team)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDetailImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.team, team) || other.team == team));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, user, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDetailImplCopyWith<_$RequestDetailImpl> get copyWith =>
      __$$RequestDetailImplCopyWithImpl<_$RequestDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestDetailImplToJson(
      this,
    );
  }
}

abstract class _RequestDetail implements RequestDetail {
  const factory _RequestDetail(
      {required final DateTime? createdAt,
      required final User? user,
      required final Team team}) = _$RequestDetailImpl;

  factory _RequestDetail.fromJson(Map<String, dynamic> json) =
      _$RequestDetailImpl.fromJson;

  @override
  DateTime? get createdAt;
  @override
  User? get user;
  @override
  Team get team;
  @override
  @JsonKey(ignore: true)
  _$$RequestDetailImplCopyWith<_$RequestDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
