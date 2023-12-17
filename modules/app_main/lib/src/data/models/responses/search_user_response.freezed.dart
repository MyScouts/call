// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponse _$SearchUserResponseFromJson(Map<String, dynamic> json) {
  return _SearchUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchUserResponse {
  List<SearchDetail> get searchUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseCopyWith<SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseCopyWith<$Res> {
  factory $SearchUserResponseCopyWith(
          SearchUserResponse value, $Res Function(SearchUserResponse) then) =
      _$SearchUserResponseCopyWithImpl<$Res, SearchUserResponse>;
  @useResult
  $Res call({List<SearchDetail> searchUsers});
}

/// @nodoc
class _$SearchUserResponseCopyWithImpl<$Res, $Val extends SearchUserResponse>
    implements $SearchUserResponseCopyWith<$Res> {
  _$SearchUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchUsers = null,
  }) {
    return _then(_value.copyWith(
      searchUsers: null == searchUsers
          ? _value.searchUsers
          : searchUsers // ignore: cast_nullable_to_non_nullable
              as List<SearchDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserResponseImplCopyWith<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  factory _$$SearchUserResponseImplCopyWith(_$SearchUserResponseImpl value,
          $Res Function(_$SearchUserResponseImpl) then) =
      __$$SearchUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchDetail> searchUsers});
}

/// @nodoc
class __$$SearchUserResponseImplCopyWithImpl<$Res>
    extends _$SearchUserResponseCopyWithImpl<$Res, _$SearchUserResponseImpl>
    implements _$$SearchUserResponseImplCopyWith<$Res> {
  __$$SearchUserResponseImplCopyWithImpl(_$SearchUserResponseImpl _value,
      $Res Function(_$SearchUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchUsers = null,
  }) {
    return _then(_$SearchUserResponseImpl(
      searchUsers: null == searchUsers
          ? _value._searchUsers
          : searchUsers // ignore: cast_nullable_to_non_nullable
              as List<SearchDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUserResponseImpl implements _SearchUserResponse {
  const _$SearchUserResponseImpl(
      {required final List<SearchDetail> searchUsers})
      : _searchUsers = searchUsers;

  factory _$SearchUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUserResponseImplFromJson(json);

  final List<SearchDetail> _searchUsers;
  @override
  List<SearchDetail> get searchUsers {
    if (_searchUsers is EqualUnmodifiableListView) return _searchUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchUsers);
  }

  @override
  String toString() {
    return 'SearchUserResponse(searchUsers: $searchUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._searchUsers, _searchUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserResponseImplCopyWith<_$SearchUserResponseImpl> get copyWith =>
      __$$SearchUserResponseImplCopyWithImpl<_$SearchUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchUserResponse implements SearchUserResponse {
  const factory _SearchUserResponse(
          {required final List<SearchDetail> searchUsers}) =
      _$SearchUserResponseImpl;

  factory _SearchUserResponse.fromJson(Map<String, dynamic> json) =
      _$SearchUserResponseImpl.fromJson;

  @override
  List<SearchDetail> get searchUsers;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserResponseImplCopyWith<_$SearchUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchDetail _$SearchDetailFromJson(Map<String, dynamic> json) {
  return _SearchDetail.fromJson(json);
}

/// @nodoc
mixin _$SearchDetail {
  SearchUser get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchDetailCopyWith<SearchDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchDetailCopyWith<$Res> {
  factory $SearchDetailCopyWith(
          SearchDetail value, $Res Function(SearchDetail) then) =
      _$SearchDetailCopyWithImpl<$Res, SearchDetail>;
  @useResult
  $Res call({SearchUser user});

  $SearchUserCopyWith<$Res> get user;
}

/// @nodoc
class _$SearchDetailCopyWithImpl<$Res, $Val extends SearchDetail>
    implements $SearchDetailCopyWith<$Res> {
  _$SearchDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SearchUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchUserCopyWith<$Res> get user {
    return $SearchUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchDetailImplCopyWith<$Res>
    implements $SearchDetailCopyWith<$Res> {
  factory _$$SearchDetailImplCopyWith(
          _$SearchDetailImpl value, $Res Function(_$SearchDetailImpl) then) =
      __$$SearchDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchUser user});

  @override
  $SearchUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SearchDetailImplCopyWithImpl<$Res>
    extends _$SearchDetailCopyWithImpl<$Res, _$SearchDetailImpl>
    implements _$$SearchDetailImplCopyWith<$Res> {
  __$$SearchDetailImplCopyWithImpl(
      _$SearchDetailImpl _value, $Res Function(_$SearchDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SearchDetailImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SearchUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchDetailImpl implements _SearchDetail {
  const _$SearchDetailImpl({required this.user});

  factory _$SearchDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchDetailImplFromJson(json);

  @override
  final SearchUser user;

  @override
  String toString() {
    return 'SearchDetail(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchDetailImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchDetailImplCopyWith<_$SearchDetailImpl> get copyWith =>
      __$$SearchDetailImplCopyWithImpl<_$SearchDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchDetailImplToJson(
      this,
    );
  }
}

abstract class _SearchDetail implements SearchDetail {
  const factory _SearchDetail({required final SearchUser user}) =
      _$SearchDetailImpl;

  factory _SearchDetail.fromJson(Map<String, dynamic> json) =
      _$SearchDetailImpl.fromJson;

  @override
  SearchUser get user;
  @override
  @JsonKey(ignore: true)
  _$$SearchDetailImplCopyWith<_$SearchDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchUser _$SearchUserFromJson(Map<String, dynamic> json) {
  return _SearchUser.fromJson(json);
}

/// @nodoc
mixin _$SearchUser {
  int get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get pDoneId => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserCopyWith<SearchUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserCopyWith<$Res> {
  factory $SearchUserCopyWith(
          SearchUser value, $Res Function(SearchUser) then) =
      _$SearchUserCopyWithImpl<$Res, SearchUser>;
  @useResult
  $Res call(
      {int id,
      String displayName,
      String? fullName,
      String? pDoneId,
      String? birthday});
}

/// @nodoc
class _$SearchUserCopyWithImpl<$Res, $Val extends SearchUser>
    implements $SearchUserCopyWith<$Res> {
  _$SearchUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? fullName = freezed,
    Object? pDoneId = freezed,
    Object? birthday = freezed,
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
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchUserImplCopyWith<$Res>
    implements $SearchUserCopyWith<$Res> {
  factory _$$SearchUserImplCopyWith(
          _$SearchUserImpl value, $Res Function(_$SearchUserImpl) then) =
      __$$SearchUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String displayName,
      String? fullName,
      String? pDoneId,
      String? birthday});
}

/// @nodoc
class __$$SearchUserImplCopyWithImpl<$Res>
    extends _$SearchUserCopyWithImpl<$Res, _$SearchUserImpl>
    implements _$$SearchUserImplCopyWith<$Res> {
  __$$SearchUserImplCopyWithImpl(
      _$SearchUserImpl _value, $Res Function(_$SearchUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? fullName = freezed,
    Object? pDoneId = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$SearchUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchUserImpl implements _SearchUser {
  const _$SearchUserImpl(
      {required this.id,
      required this.displayName,
      this.fullName,
      this.pDoneId,
      this.birthday});

  factory _$SearchUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchUserImplFromJson(json);

  @override
  final int id;
  @override
  final String displayName;
  @override
  final String? fullName;
  @override
  final String? pDoneId;
  @override
  final String? birthday;

  @override
  String toString() {
    return 'SearchUser(id: $id, displayName: $displayName, fullName: $fullName, pDoneId: $pDoneId, birthday: $birthday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayName, fullName, pDoneId, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      __$$SearchUserImplCopyWithImpl<_$SearchUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchUserImplToJson(
      this,
    );
  }
}

abstract class _SearchUser implements SearchUser {
  const factory _SearchUser(
      {required final int id,
      required final String displayName,
      final String? fullName,
      final String? pDoneId,
      final String? birthday}) = _$SearchUserImpl;

  factory _SearchUser.fromJson(Map<String, dynamic> json) =
      _$SearchUserImpl.fromJson;

  @override
  int get id;
  @override
  String get displayName;
  @override
  String? get fullName;
  @override
  String? get pDoneId;
  @override
  String? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
