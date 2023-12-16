// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JoinRequestResponse _$JoinRequestResponseFromJson(Map<String, dynamic> json) {
  return _JoinRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$JoinRequestResponse {
  List<JoinRequest> get requests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinRequestResponseCopyWith<JoinRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRequestResponseCopyWith<$Res> {
  factory $JoinRequestResponseCopyWith(
          JoinRequestResponse value, $Res Function(JoinRequestResponse) then) =
      _$JoinRequestResponseCopyWithImpl<$Res, JoinRequestResponse>;
  @useResult
  $Res call({List<JoinRequest> requests});
}

/// @nodoc
class _$JoinRequestResponseCopyWithImpl<$Res, $Val extends JoinRequestResponse>
    implements $JoinRequestResponseCopyWith<$Res> {
  _$JoinRequestResponseCopyWithImpl(this._value, this._then);

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
              as List<JoinRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinRequestResponseImplCopyWith<$Res>
    implements $JoinRequestResponseCopyWith<$Res> {
  factory _$$JoinRequestResponseImplCopyWith(_$JoinRequestResponseImpl value,
          $Res Function(_$JoinRequestResponseImpl) then) =
      __$$JoinRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JoinRequest> requests});
}

/// @nodoc
class __$$JoinRequestResponseImplCopyWithImpl<$Res>
    extends _$JoinRequestResponseCopyWithImpl<$Res, _$JoinRequestResponseImpl>
    implements _$$JoinRequestResponseImplCopyWith<$Res> {
  __$$JoinRequestResponseImplCopyWithImpl(_$JoinRequestResponseImpl _value,
      $Res Function(_$JoinRequestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = null,
  }) {
    return _then(_$JoinRequestResponseImpl(
      requests: null == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<JoinRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRequestResponseImpl implements _JoinRequestResponse {
  const _$JoinRequestResponseImpl({required final List<JoinRequest> requests})
      : _requests = requests;

  factory _$JoinRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRequestResponseImplFromJson(json);

  final List<JoinRequest> _requests;
  @override
  List<JoinRequest> get requests {
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requests);
  }

  @override
  String toString() {
    return 'JoinRequestResponse(requests: $requests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRequestResponseImpl &&
            const DeepCollectionEquality().equals(other._requests, _requests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_requests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRequestResponseImplCopyWith<_$JoinRequestResponseImpl> get copyWith =>
      __$$JoinRequestResponseImplCopyWithImpl<_$JoinRequestResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _JoinRequestResponse implements JoinRequestResponse {
  const factory _JoinRequestResponse(
      {required final List<JoinRequest> requests}) = _$JoinRequestResponseImpl;

  factory _JoinRequestResponse.fromJson(Map<String, dynamic> json) =
      _$JoinRequestResponseImpl.fromJson;

  @override
  List<JoinRequest> get requests;
  @override
  @JsonKey(ignore: true)
  _$$JoinRequestResponseImplCopyWith<_$JoinRequestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JoinRequest _$JoinRequestFromJson(Map<String, dynamic> json) {
  return _JoinRequest.fromJson(json);
}

/// @nodoc
mixin _$JoinRequest {
  int get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinRequestCopyWith<JoinRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRequestCopyWith<$Res> {
  factory $JoinRequestCopyWith(
          JoinRequest value, $Res Function(JoinRequest) then) =
      _$JoinRequestCopyWithImpl<$Res, JoinRequest>;
  @useResult
  $Res call({int id, DateTime createdAt, Team team});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class _$JoinRequestCopyWithImpl<$Res, $Val extends JoinRequest>
    implements $JoinRequestCopyWith<$Res> {
  _$JoinRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? team = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ) as $Val);
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
abstract class _$$JoinRequestImplCopyWith<$Res>
    implements $JoinRequestCopyWith<$Res> {
  factory _$$JoinRequestImplCopyWith(
          _$JoinRequestImpl value, $Res Function(_$JoinRequestImpl) then) =
      __$$JoinRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime createdAt, Team team});

  @override
  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$JoinRequestImplCopyWithImpl<$Res>
    extends _$JoinRequestCopyWithImpl<$Res, _$JoinRequestImpl>
    implements _$$JoinRequestImplCopyWith<$Res> {
  __$$JoinRequestImplCopyWithImpl(
      _$JoinRequestImpl _value, $Res Function(_$JoinRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? team = null,
  }) {
    return _then(_$JoinRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRequestImpl implements _JoinRequest {
  const _$JoinRequestImpl(
      {required this.id, required this.createdAt, required this.team});

  factory _$JoinRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRequestImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final Team team;

  @override
  String toString() {
    return 'JoinRequest(id: $id, createdAt: $createdAt, team: $team)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.team, team) || other.team == team));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, team);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRequestImplCopyWith<_$JoinRequestImpl> get copyWith =>
      __$$JoinRequestImplCopyWithImpl<_$JoinRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRequestImplToJson(
      this,
    );
  }
}

abstract class _JoinRequest implements JoinRequest {
  const factory _JoinRequest(
      {required final int id,
      required final DateTime createdAt,
      required final Team team}) = _$JoinRequestImpl;

  factory _JoinRequest.fromJson(Map<String, dynamic> json) =
      _$JoinRequestImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get createdAt;
  @override
  Team get team;
  @override
  @JsonKey(ignore: true)
  _$$JoinRequestImplCopyWith<_$JoinRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
