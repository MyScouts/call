// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUserFollowDetailResponse _$GetUserFollowDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _GetUserFollowDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserFollowDetailResponse {
  GetUserFollowStartResponse get stats => throw _privateConstructorUsedError;
  GetUserFollowRelationResponse get relation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserFollowDetailResponseCopyWith<GetUserFollowDetailResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserFollowDetailResponseCopyWith<$Res> {
  factory $GetUserFollowDetailResponseCopyWith(
          GetUserFollowDetailResponse value,
          $Res Function(GetUserFollowDetailResponse) then) =
      _$GetUserFollowDetailResponseCopyWithImpl<$Res,
          GetUserFollowDetailResponse>;
  @useResult
  $Res call(
      {GetUserFollowStartResponse stats,
      GetUserFollowRelationResponse relation});

  $GetUserFollowStartResponseCopyWith<$Res> get stats;
  $GetUserFollowRelationResponseCopyWith<$Res> get relation;
}

/// @nodoc
class _$GetUserFollowDetailResponseCopyWithImpl<$Res,
        $Val extends GetUserFollowDetailResponse>
    implements $GetUserFollowDetailResponseCopyWith<$Res> {
  _$GetUserFollowDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? relation = null,
  }) {
    return _then(_value.copyWith(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as GetUserFollowStartResponse,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as GetUserFollowRelationResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserFollowStartResponseCopyWith<$Res> get stats {
    return $GetUserFollowStartResponseCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GetUserFollowRelationResponseCopyWith<$Res> get relation {
    return $GetUserFollowRelationResponseCopyWith<$Res>(_value.relation,
        (value) {
      return _then(_value.copyWith(relation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserFollowDetailResponseImplCopyWith<$Res>
    implements $GetUserFollowDetailResponseCopyWith<$Res> {
  factory _$$GetUserFollowDetailResponseImplCopyWith(
          _$GetUserFollowDetailResponseImpl value,
          $Res Function(_$GetUserFollowDetailResponseImpl) then) =
      __$$GetUserFollowDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GetUserFollowStartResponse stats,
      GetUserFollowRelationResponse relation});

  @override
  $GetUserFollowStartResponseCopyWith<$Res> get stats;
  @override
  $GetUserFollowRelationResponseCopyWith<$Res> get relation;
}

/// @nodoc
class __$$GetUserFollowDetailResponseImplCopyWithImpl<$Res>
    extends _$GetUserFollowDetailResponseCopyWithImpl<$Res,
        _$GetUserFollowDetailResponseImpl>
    implements _$$GetUserFollowDetailResponseImplCopyWith<$Res> {
  __$$GetUserFollowDetailResponseImplCopyWithImpl(
      _$GetUserFollowDetailResponseImpl _value,
      $Res Function(_$GetUserFollowDetailResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? relation = null,
  }) {
    return _then(_$GetUserFollowDetailResponseImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as GetUserFollowStartResponse,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as GetUserFollowRelationResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserFollowDetailResponseImpl
    implements _GetUserFollowDetailResponse {
  const _$GetUserFollowDetailResponseImpl(
      {required this.stats, required this.relation});

  factory _$GetUserFollowDetailResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetUserFollowDetailResponseImplFromJson(json);

  @override
  final GetUserFollowStartResponse stats;
  @override
  final GetUserFollowRelationResponse relation;

  @override
  String toString() {
    return 'GetUserFollowDetailResponse(stats: $stats, relation: $relation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserFollowDetailResponseImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stats, relation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserFollowDetailResponseImplCopyWith<_$GetUserFollowDetailResponseImpl>
      get copyWith => __$$GetUserFollowDetailResponseImplCopyWithImpl<
          _$GetUserFollowDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserFollowDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserFollowDetailResponse
    implements GetUserFollowDetailResponse {
  const factory _GetUserFollowDetailResponse(
          {required final GetUserFollowStartResponse stats,
          required final GetUserFollowRelationResponse relation}) =
      _$GetUserFollowDetailResponseImpl;

  factory _GetUserFollowDetailResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserFollowDetailResponseImpl.fromJson;

  @override
  GetUserFollowStartResponse get stats;
  @override
  GetUserFollowRelationResponse get relation;
  @override
  @JsonKey(ignore: true)
  _$$GetUserFollowDetailResponseImplCopyWith<_$GetUserFollowDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetUserFollowStartResponse _$GetUserFollowStartResponseFromJson(
    Map<String, dynamic> json) {
  return _GetUserFollowStartResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserFollowStartResponse {
  int get friendCount => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  int get followeeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserFollowStartResponseCopyWith<GetUserFollowStartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserFollowStartResponseCopyWith<$Res> {
  factory $GetUserFollowStartResponseCopyWith(GetUserFollowStartResponse value,
          $Res Function(GetUserFollowStartResponse) then) =
      _$GetUserFollowStartResponseCopyWithImpl<$Res,
          GetUserFollowStartResponse>;
  @useResult
  $Res call({int friendCount, int followerCount, int followeeCount});
}

/// @nodoc
class _$GetUserFollowStartResponseCopyWithImpl<$Res,
        $Val extends GetUserFollowStartResponse>
    implements $GetUserFollowStartResponseCopyWith<$Res> {
  _$GetUserFollowStartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendCount = null,
    Object? followerCount = null,
    Object? followeeCount = null,
  }) {
    return _then(_value.copyWith(
      friendCount: null == friendCount
          ? _value.friendCount
          : friendCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followeeCount: null == followeeCount
          ? _value.followeeCount
          : followeeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserFollowStartResponseImplCopyWith<$Res>
    implements $GetUserFollowStartResponseCopyWith<$Res> {
  factory _$$GetUserFollowStartResponseImplCopyWith(
          _$GetUserFollowStartResponseImpl value,
          $Res Function(_$GetUserFollowStartResponseImpl) then) =
      __$$GetUserFollowStartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int friendCount, int followerCount, int followeeCount});
}

/// @nodoc
class __$$GetUserFollowStartResponseImplCopyWithImpl<$Res>
    extends _$GetUserFollowStartResponseCopyWithImpl<$Res,
        _$GetUserFollowStartResponseImpl>
    implements _$$GetUserFollowStartResponseImplCopyWith<$Res> {
  __$$GetUserFollowStartResponseImplCopyWithImpl(
      _$GetUserFollowStartResponseImpl _value,
      $Res Function(_$GetUserFollowStartResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendCount = null,
    Object? followerCount = null,
    Object? followeeCount = null,
  }) {
    return _then(_$GetUserFollowStartResponseImpl(
      friendCount: null == friendCount
          ? _value.friendCount
          : friendCount // ignore: cast_nullable_to_non_nullable
              as int,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followeeCount: null == followeeCount
          ? _value.followeeCount
          : followeeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserFollowStartResponseImpl implements _GetUserFollowStartResponse {
  const _$GetUserFollowStartResponseImpl(
      {required this.friendCount,
      required this.followerCount,
      required this.followeeCount});

  factory _$GetUserFollowStartResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetUserFollowStartResponseImplFromJson(json);

  @override
  final int friendCount;
  @override
  final int followerCount;
  @override
  final int followeeCount;

  @override
  String toString() {
    return 'GetUserFollowStartResponse(friendCount: $friendCount, followerCount: $followerCount, followeeCount: $followeeCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserFollowStartResponseImpl &&
            (identical(other.friendCount, friendCount) ||
                other.friendCount == friendCount) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followeeCount, followeeCount) ||
                other.followeeCount == followeeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, friendCount, followerCount, followeeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserFollowStartResponseImplCopyWith<_$GetUserFollowStartResponseImpl>
      get copyWith => __$$GetUserFollowStartResponseImplCopyWithImpl<
          _$GetUserFollowStartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserFollowStartResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserFollowStartResponse
    implements GetUserFollowStartResponse {
  const factory _GetUserFollowStartResponse(
      {required final int friendCount,
      required final int followerCount,
      required final int followeeCount}) = _$GetUserFollowStartResponseImpl;

  factory _GetUserFollowStartResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserFollowStartResponseImpl.fromJson;

  @override
  int get friendCount;
  @override
  int get followerCount;
  @override
  int get followeeCount;
  @override
  @JsonKey(ignore: true)
  _$$GetUserFollowStartResponseImplCopyWith<_$GetUserFollowStartResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetUserFollowRelationResponse _$GetUserFollowRelationResponseFromJson(
    Map<String, dynamic> json) {
  return _GetUserFollowRelationResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserFollowRelationResponse {
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isFollower => throw _privateConstructorUsedError;
  bool get isFollowee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserFollowRelationResponseCopyWith<GetUserFollowRelationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserFollowRelationResponseCopyWith<$Res> {
  factory $GetUserFollowRelationResponseCopyWith(
          GetUserFollowRelationResponse value,
          $Res Function(GetUserFollowRelationResponse) then) =
      _$GetUserFollowRelationResponseCopyWithImpl<$Res,
          GetUserFollowRelationResponse>;
  @useResult
  $Res call({bool isFriend, bool isFollower, bool isFollowee});
}

/// @nodoc
class _$GetUserFollowRelationResponseCopyWithImpl<$Res,
        $Val extends GetUserFollowRelationResponse>
    implements $GetUserFollowRelationResponseCopyWith<$Res> {
  _$GetUserFollowRelationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollower = null,
    Object? isFollowee = null,
  }) {
    return _then(_value.copyWith(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowee: null == isFollowee
          ? _value.isFollowee
          : isFollowee // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserFollowRelationResponseImplCopyWith<$Res>
    implements $GetUserFollowRelationResponseCopyWith<$Res> {
  factory _$$GetUserFollowRelationResponseImplCopyWith(
          _$GetUserFollowRelationResponseImpl value,
          $Res Function(_$GetUserFollowRelationResponseImpl) then) =
      __$$GetUserFollowRelationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFriend, bool isFollower, bool isFollowee});
}

/// @nodoc
class __$$GetUserFollowRelationResponseImplCopyWithImpl<$Res>
    extends _$GetUserFollowRelationResponseCopyWithImpl<$Res,
        _$GetUserFollowRelationResponseImpl>
    implements _$$GetUserFollowRelationResponseImplCopyWith<$Res> {
  __$$GetUserFollowRelationResponseImplCopyWithImpl(
      _$GetUserFollowRelationResponseImpl _value,
      $Res Function(_$GetUserFollowRelationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollower = null,
    Object? isFollowee = null,
  }) {
    return _then(_$GetUserFollowRelationResponseImpl(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowee: null == isFollowee
          ? _value.isFollowee
          : isFollowee // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserFollowRelationResponseImpl
    implements _GetUserFollowRelationResponse {
  const _$GetUserFollowRelationResponseImpl(
      {required this.isFriend,
      required this.isFollower,
      required this.isFollowee});

  factory _$GetUserFollowRelationResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetUserFollowRelationResponseImplFromJson(json);

  @override
  final bool isFriend;
  @override
  final bool isFollower;
  @override
  final bool isFollowee;

  @override
  String toString() {
    return 'GetUserFollowRelationResponse(isFriend: $isFriend, isFollower: $isFollower, isFollowee: $isFollowee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserFollowRelationResponseImpl &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isFollower, isFollower) ||
                other.isFollower == isFollower) &&
            (identical(other.isFollowee, isFollowee) ||
                other.isFollowee == isFollowee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isFriend, isFollower, isFollowee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserFollowRelationResponseImplCopyWith<
          _$GetUserFollowRelationResponseImpl>
      get copyWith => __$$GetUserFollowRelationResponseImplCopyWithImpl<
          _$GetUserFollowRelationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserFollowRelationResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserFollowRelationResponse
    implements GetUserFollowRelationResponse {
  const factory _GetUserFollowRelationResponse(
      {required final bool isFriend,
      required final bool isFollower,
      required final bool isFollowee}) = _$GetUserFollowRelationResponseImpl;

  factory _GetUserFollowRelationResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserFollowRelationResponseImpl.fromJson;

  @override
  bool get isFriend;
  @override
  bool get isFollower;
  @override
  bool get isFollowee;
  @override
  @JsonKey(ignore: true)
  _$$GetUserFollowRelationResponseImplCopyWith<
          _$GetUserFollowRelationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApprovedRequestResponse _$ApprovedRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _ApprovedRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$ApprovedRequestResponse {
  List<ApprovedRequestDetail> get approvals =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovedRequestResponseCopyWith<ApprovedRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovedRequestResponseCopyWith<$Res> {
  factory $ApprovedRequestResponseCopyWith(ApprovedRequestResponse value,
          $Res Function(ApprovedRequestResponse) then) =
      _$ApprovedRequestResponseCopyWithImpl<$Res, ApprovedRequestResponse>;
  @useResult
  $Res call({List<ApprovedRequestDetail> approvals});
}

/// @nodoc
class _$ApprovedRequestResponseCopyWithImpl<$Res,
        $Val extends ApprovedRequestResponse>
    implements $ApprovedRequestResponseCopyWith<$Res> {
  _$ApprovedRequestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvals = null,
  }) {
    return _then(_value.copyWith(
      approvals: null == approvals
          ? _value.approvals
          : approvals // ignore: cast_nullable_to_non_nullable
              as List<ApprovedRequestDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApprovedRequestResponseImplCopyWith<$Res>
    implements $ApprovedRequestResponseCopyWith<$Res> {
  factory _$$ApprovedRequestResponseImplCopyWith(
          _$ApprovedRequestResponseImpl value,
          $Res Function(_$ApprovedRequestResponseImpl) then) =
      __$$ApprovedRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ApprovedRequestDetail> approvals});
}

/// @nodoc
class __$$ApprovedRequestResponseImplCopyWithImpl<$Res>
    extends _$ApprovedRequestResponseCopyWithImpl<$Res,
        _$ApprovedRequestResponseImpl>
    implements _$$ApprovedRequestResponseImplCopyWith<$Res> {
  __$$ApprovedRequestResponseImplCopyWithImpl(
      _$ApprovedRequestResponseImpl _value,
      $Res Function(_$ApprovedRequestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approvals = null,
  }) {
    return _then(_$ApprovedRequestResponseImpl(
      approvals: null == approvals
          ? _value._approvals
          : approvals // ignore: cast_nullable_to_non_nullable
              as List<ApprovedRequestDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovedRequestResponseImpl implements _ApprovedRequestResponse {
  const _$ApprovedRequestResponseImpl(
      {required final List<ApprovedRequestDetail> approvals})
      : _approvals = approvals;

  factory _$ApprovedRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovedRequestResponseImplFromJson(json);

  final List<ApprovedRequestDetail> _approvals;
  @override
  List<ApprovedRequestDetail> get approvals {
    if (_approvals is EqualUnmodifiableListView) return _approvals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approvals);
  }

  @override
  String toString() {
    return 'ApprovedRequestResponse(approvals: $approvals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovedRequestResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._approvals, _approvals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_approvals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovedRequestResponseImplCopyWith<_$ApprovedRequestResponseImpl>
      get copyWith => __$$ApprovedRequestResponseImplCopyWithImpl<
          _$ApprovedRequestResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovedRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _ApprovedRequestResponse implements ApprovedRequestResponse {
  const factory _ApprovedRequestResponse(
          {required final List<ApprovedRequestDetail> approvals}) =
      _$ApprovedRequestResponseImpl;

  factory _ApprovedRequestResponse.fromJson(Map<String, dynamic> json) =
      _$ApprovedRequestResponseImpl.fromJson;

  @override
  List<ApprovedRequestDetail> get approvals;
  @override
  @JsonKey(ignore: true)
  _$$ApprovedRequestResponseImplCopyWith<_$ApprovedRequestResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApprovedRequestDetail _$ApprovedRequestDetailFromJson(
    Map<String, dynamic> json) {
  return _ApprovedRequestDetail.fromJson(json);
}

/// @nodoc
mixin _$ApprovedRequestDetail {
  int get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  ApprovedRequestUser? get followee => throw _privateConstructorUsedError;
  ApprovedRequestUser? get follower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovedRequestDetailCopyWith<ApprovedRequestDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovedRequestDetailCopyWith<$Res> {
  factory $ApprovedRequestDetailCopyWith(ApprovedRequestDetail value,
          $Res Function(ApprovedRequestDetail) then) =
      _$ApprovedRequestDetailCopyWithImpl<$Res, ApprovedRequestDetail>;
  @useResult
  $Res call(
      {int id,
      String createdAt,
      ApprovedRequestUser? followee,
      ApprovedRequestUser? follower});

  $ApprovedRequestUserCopyWith<$Res>? get followee;
  $ApprovedRequestUserCopyWith<$Res>? get follower;
}

/// @nodoc
class _$ApprovedRequestDetailCopyWithImpl<$Res,
        $Val extends ApprovedRequestDetail>
    implements $ApprovedRequestDetailCopyWith<$Res> {
  _$ApprovedRequestDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? followee = freezed,
    Object? follower = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      followee: freezed == followee
          ? _value.followee
          : followee // ignore: cast_nullable_to_non_nullable
              as ApprovedRequestUser?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as ApprovedRequestUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovedRequestUserCopyWith<$Res>? get followee {
    if (_value.followee == null) {
      return null;
    }

    return $ApprovedRequestUserCopyWith<$Res>(_value.followee!, (value) {
      return _then(_value.copyWith(followee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovedRequestUserCopyWith<$Res>? get follower {
    if (_value.follower == null) {
      return null;
    }

    return $ApprovedRequestUserCopyWith<$Res>(_value.follower!, (value) {
      return _then(_value.copyWith(follower: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApprovedRequestDetailImplCopyWith<$Res>
    implements $ApprovedRequestDetailCopyWith<$Res> {
  factory _$$ApprovedRequestDetailImplCopyWith(
          _$ApprovedRequestDetailImpl value,
          $Res Function(_$ApprovedRequestDetailImpl) then) =
      __$$ApprovedRequestDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String createdAt,
      ApprovedRequestUser? followee,
      ApprovedRequestUser? follower});

  @override
  $ApprovedRequestUserCopyWith<$Res>? get followee;
  @override
  $ApprovedRequestUserCopyWith<$Res>? get follower;
}

/// @nodoc
class __$$ApprovedRequestDetailImplCopyWithImpl<$Res>
    extends _$ApprovedRequestDetailCopyWithImpl<$Res,
        _$ApprovedRequestDetailImpl>
    implements _$$ApprovedRequestDetailImplCopyWith<$Res> {
  __$$ApprovedRequestDetailImplCopyWithImpl(_$ApprovedRequestDetailImpl _value,
      $Res Function(_$ApprovedRequestDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? followee = freezed,
    Object? follower = freezed,
  }) {
    return _then(_$ApprovedRequestDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      followee: freezed == followee
          ? _value.followee
          : followee // ignore: cast_nullable_to_non_nullable
              as ApprovedRequestUser?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as ApprovedRequestUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovedRequestDetailImpl implements _ApprovedRequestDetail {
  const _$ApprovedRequestDetailImpl(
      {required this.id,
      required this.createdAt,
      required this.followee,
      required this.follower});

  factory _$ApprovedRequestDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovedRequestDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String createdAt;
  @override
  final ApprovedRequestUser? followee;
  @override
  final ApprovedRequestUser? follower;

  @override
  String toString() {
    return 'ApprovedRequestDetail(id: $id, createdAt: $createdAt, followee: $followee, follower: $follower)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovedRequestDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.followee, followee) ||
                other.followee == followee) &&
            (identical(other.follower, follower) ||
                other.follower == follower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createdAt, followee, follower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovedRequestDetailImplCopyWith<_$ApprovedRequestDetailImpl>
      get copyWith => __$$ApprovedRequestDetailImplCopyWithImpl<
          _$ApprovedRequestDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovedRequestDetailImplToJson(
      this,
    );
  }
}

abstract class _ApprovedRequestDetail implements ApprovedRequestDetail {
  const factory _ApprovedRequestDetail(
          {required final int id,
          required final String createdAt,
          required final ApprovedRequestUser? followee,
          required final ApprovedRequestUser? follower}) =
      _$ApprovedRequestDetailImpl;

  factory _ApprovedRequestDetail.fromJson(Map<String, dynamic> json) =
      _$ApprovedRequestDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get createdAt;
  @override
  ApprovedRequestUser? get followee;
  @override
  ApprovedRequestUser? get follower;
  @override
  @JsonKey(ignore: true)
  _$$ApprovedRequestDetailImplCopyWith<_$ApprovedRequestDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApprovedRequestUser _$ApprovedRequestUserFromJson(Map<String, dynamic> json) {
  return _ApprovedRequestUser.fromJson(json);
}

/// @nodoc
mixin _$ApprovedRequestUser {
  int get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get pDoneId => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  int get sexCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovedRequestUserCopyWith<ApprovedRequestUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovedRequestUserCopyWith<$Res> {
  factory $ApprovedRequestUserCopyWith(
          ApprovedRequestUser value, $Res Function(ApprovedRequestUser) then) =
      _$ApprovedRequestUserCopyWithImpl<$Res, ApprovedRequestUser>;
  @useResult
  $Res call(
      {int id,
      String displayName,
      String? avatar,
      String pDoneId,
      String fullName,
      String birthday,
      int sexCode});
}

/// @nodoc
class _$ApprovedRequestUserCopyWithImpl<$Res, $Val extends ApprovedRequestUser>
    implements $ApprovedRequestUserCopyWith<$Res> {
  _$ApprovedRequestUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? avatar = freezed,
    Object? pDoneId = null,
    Object? fullName = null,
    Object? birthday = null,
    Object? sexCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      sexCode: null == sexCode
          ? _value.sexCode
          : sexCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApprovedRequestUserImplCopyWith<$Res>
    implements $ApprovedRequestUserCopyWith<$Res> {
  factory _$$ApprovedRequestUserImplCopyWith(_$ApprovedRequestUserImpl value,
          $Res Function(_$ApprovedRequestUserImpl) then) =
      __$$ApprovedRequestUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String displayName,
      String? avatar,
      String pDoneId,
      String fullName,
      String birthday,
      int sexCode});
}

/// @nodoc
class __$$ApprovedRequestUserImplCopyWithImpl<$Res>
    extends _$ApprovedRequestUserCopyWithImpl<$Res, _$ApprovedRequestUserImpl>
    implements _$$ApprovedRequestUserImplCopyWith<$Res> {
  __$$ApprovedRequestUserImplCopyWithImpl(_$ApprovedRequestUserImpl _value,
      $Res Function(_$ApprovedRequestUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? avatar = freezed,
    Object? pDoneId = null,
    Object? fullName = null,
    Object? birthday = null,
    Object? sexCode = null,
  }) {
    return _then(_$ApprovedRequestUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      sexCode: null == sexCode
          ? _value.sexCode
          : sexCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApprovedRequestUserImpl implements _ApprovedRequestUser {
  const _$ApprovedRequestUserImpl(
      {required this.id,
      required this.displayName,
      this.avatar,
      required this.pDoneId,
      required this.fullName,
      required this.birthday,
      required this.sexCode});

  factory _$ApprovedRequestUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApprovedRequestUserImplFromJson(json);

  @override
  final int id;
  @override
  final String displayName;
  @override
  final String? avatar;
  @override
  final String pDoneId;
  @override
  final String fullName;
  @override
  final String birthday;
  @override
  final int sexCode;

  @override
  String toString() {
    return 'ApprovedRequestUser(id: $id, displayName: $displayName, avatar: $avatar, pDoneId: $pDoneId, fullName: $fullName, birthday: $birthday, sexCode: $sexCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovedRequestUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.sexCode, sexCode) || other.sexCode == sexCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, avatar, pDoneId,
      fullName, birthday, sexCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovedRequestUserImplCopyWith<_$ApprovedRequestUserImpl> get copyWith =>
      __$$ApprovedRequestUserImplCopyWithImpl<_$ApprovedRequestUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApprovedRequestUserImplToJson(
      this,
    );
  }
}

abstract class _ApprovedRequestUser implements ApprovedRequestUser {
  const factory _ApprovedRequestUser(
      {required final int id,
      required final String displayName,
      final String? avatar,
      required final String pDoneId,
      required final String fullName,
      required final String birthday,
      required final int sexCode}) = _$ApprovedRequestUserImpl;

  factory _ApprovedRequestUser.fromJson(Map<String, dynamic> json) =
      _$ApprovedRequestUserImpl.fromJson;

  @override
  int get id;
  @override
  String get displayName;
  @override
  String? get avatar;
  @override
  String get pDoneId;
  @override
  String get fullName;
  @override
  String get birthday;
  @override
  int get sexCode;
  @override
  @JsonKey(ignore: true)
  _$$ApprovedRequestUserImplCopyWith<_$ApprovedRequestUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
