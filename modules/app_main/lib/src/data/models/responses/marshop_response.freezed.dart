// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marshop_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListMarshopResponse _$ListMarshopResponseFromJson(Map<String, dynamic> json) {
  return _ListMarshopResponse.fromJson(json);
}

/// @nodoc
mixin _$ListMarshopResponse {
  int get total => throw _privateConstructorUsedError;
  List<MarshopInfo> get marshops => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListMarshopResponseCopyWith<ListMarshopResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListMarshopResponseCopyWith<$Res> {
  factory $ListMarshopResponseCopyWith(
          ListMarshopResponse value, $Res Function(ListMarshopResponse) then) =
      _$ListMarshopResponseCopyWithImpl<$Res, ListMarshopResponse>;
  @useResult
  $Res call({int total, List<MarshopInfo> marshops});
}

/// @nodoc
class _$ListMarshopResponseCopyWithImpl<$Res, $Val extends ListMarshopResponse>
    implements $ListMarshopResponseCopyWith<$Res> {
  _$ListMarshopResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? marshops = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      marshops: null == marshops
          ? _value.marshops
          : marshops // ignore: cast_nullable_to_non_nullable
              as List<MarshopInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListMarshopResponseImplCopyWith<$Res>
    implements $ListMarshopResponseCopyWith<$Res> {
  factory _$$ListMarshopResponseImplCopyWith(_$ListMarshopResponseImpl value,
          $Res Function(_$ListMarshopResponseImpl) then) =
      __$$ListMarshopResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<MarshopInfo> marshops});
}

/// @nodoc
class __$$ListMarshopResponseImplCopyWithImpl<$Res>
    extends _$ListMarshopResponseCopyWithImpl<$Res, _$ListMarshopResponseImpl>
    implements _$$ListMarshopResponseImplCopyWith<$Res> {
  __$$ListMarshopResponseImplCopyWithImpl(_$ListMarshopResponseImpl _value,
      $Res Function(_$ListMarshopResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? marshops = null,
  }) {
    return _then(_$ListMarshopResponseImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      marshops: null == marshops
          ? _value._marshops
          : marshops // ignore: cast_nullable_to_non_nullable
              as List<MarshopInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListMarshopResponseImpl implements _ListMarshopResponse {
  const _$ListMarshopResponseImpl(
      {required this.total, required final List<MarshopInfo> marshops})
      : _marshops = marshops;

  factory _$ListMarshopResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListMarshopResponseImplFromJson(json);

  @override
  final int total;
  final List<MarshopInfo> _marshops;
  @override
  List<MarshopInfo> get marshops {
    if (_marshops is EqualUnmodifiableListView) return _marshops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marshops);
  }

  @override
  String toString() {
    return 'ListMarshopResponse(total: $total, marshops: $marshops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListMarshopResponseImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._marshops, _marshops));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_marshops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListMarshopResponseImplCopyWith<_$ListMarshopResponseImpl> get copyWith =>
      __$$ListMarshopResponseImplCopyWithImpl<_$ListMarshopResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListMarshopResponseImplToJson(
      this,
    );
  }
}

abstract class _ListMarshopResponse implements ListMarshopResponse {
  const factory _ListMarshopResponse(
      {required final int total,
      required final List<MarshopInfo> marshops}) = _$ListMarshopResponseImpl;

  factory _ListMarshopResponse.fromJson(Map<String, dynamic> json) =
      _$ListMarshopResponseImpl.fromJson;

  @override
  int get total;
  @override
  List<MarshopInfo> get marshops;
  @override
  @JsonKey(ignore: true)
  _$$ListMarshopResponseImplCopyWith<_$ListMarshopResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarshopInfo _$MarshopInfoFromJson(Map<String, dynamic> json) {
  return _MarshopInfo.fromJson(json);
}

/// @nodoc
mixin _$MarshopInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  MarshopUserInfo get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopInfoCopyWith<MarshopInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopInfoCopyWith<$Res> {
  factory $MarshopInfoCopyWith(
          MarshopInfo value, $Res Function(MarshopInfo) then) =
      _$MarshopInfoCopyWithImpl<$Res, MarshopInfo>;
  @useResult
  $Res call({int id, String name, String code, MarshopUserInfo user});

  $MarshopUserInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$MarshopInfoCopyWithImpl<$Res, $Val extends MarshopInfo>
    implements $MarshopInfoCopyWith<$Res> {
  _$MarshopInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MarshopUserInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarshopUserInfoCopyWith<$Res> get user {
    return $MarshopUserInfoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarshopInfoImplCopyWith<$Res>
    implements $MarshopInfoCopyWith<$Res> {
  factory _$$MarshopInfoImplCopyWith(
          _$MarshopInfoImpl value, $Res Function(_$MarshopInfoImpl) then) =
      __$$MarshopInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String code, MarshopUserInfo user});

  @override
  $MarshopUserInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$MarshopInfoImplCopyWithImpl<$Res>
    extends _$MarshopInfoCopyWithImpl<$Res, _$MarshopInfoImpl>
    implements _$$MarshopInfoImplCopyWith<$Res> {
  __$$MarshopInfoImplCopyWithImpl(
      _$MarshopInfoImpl _value, $Res Function(_$MarshopInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? user = null,
  }) {
    return _then(_$MarshopInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as MarshopUserInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarshopInfoImpl implements _MarshopInfo {
  const _$MarshopInfoImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.user});

  factory _$MarshopInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarshopInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;
  @override
  final MarshopUserInfo user;

  @override
  String toString() {
    return 'MarshopInfo(id: $id, name: $name, code: $code, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopInfoImplCopyWith<_$MarshopInfoImpl> get copyWith =>
      __$$MarshopInfoImplCopyWithImpl<_$MarshopInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopInfoImplToJson(
      this,
    );
  }
}

abstract class _MarshopInfo implements MarshopInfo {
  const factory _MarshopInfo(
      {required final int id,
      required final String name,
      required final String code,
      required final MarshopUserInfo user}) = _$MarshopInfoImpl;

  factory _MarshopInfo.fromJson(Map<String, dynamic> json) =
      _$MarshopInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  MarshopUserInfo get user;
  @override
  @JsonKey(ignore: true)
  _$$MarshopInfoImplCopyWith<_$MarshopInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarshopUserInfo _$MarshopUserInfoFromJson(Map<String, dynamic> json) {
  return _MarshopUserInfo.fromJson(json);
}

/// @nodoc
mixin _$MarshopUserInfo {
  int get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get pDoneId => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopUserInfoCopyWith<MarshopUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopUserInfoCopyWith<$Res> {
  factory $MarshopUserInfoCopyWith(
          MarshopUserInfo value, $Res Function(MarshopUserInfo) then) =
      _$MarshopUserInfoCopyWithImpl<$Res, MarshopUserInfo>;
  @useResult
  $Res call(
      {int id,
      String displayName,
      String pDoneId,
      String? fullName,
      String? birthday});
}

/// @nodoc
class _$MarshopUserInfoCopyWithImpl<$Res, $Val extends MarshopUserInfo>
    implements $MarshopUserInfoCopyWith<$Res> {
  _$MarshopUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? pDoneId = null,
    Object? fullName = freezed,
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
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarshopUserInfoImplCopyWith<$Res>
    implements $MarshopUserInfoCopyWith<$Res> {
  factory _$$MarshopUserInfoImplCopyWith(_$MarshopUserInfoImpl value,
          $Res Function(_$MarshopUserInfoImpl) then) =
      __$$MarshopUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String displayName,
      String pDoneId,
      String? fullName,
      String? birthday});
}

/// @nodoc
class __$$MarshopUserInfoImplCopyWithImpl<$Res>
    extends _$MarshopUserInfoCopyWithImpl<$Res, _$MarshopUserInfoImpl>
    implements _$$MarshopUserInfoImplCopyWith<$Res> {
  __$$MarshopUserInfoImplCopyWithImpl(
      _$MarshopUserInfoImpl _value, $Res Function(_$MarshopUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? pDoneId = null,
    Object? fullName = freezed,
    Object? birthday = freezed,
  }) {
    return _then(_$MarshopUserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
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
class _$MarshopUserInfoImpl implements _MarshopUserInfo {
  const _$MarshopUserInfoImpl(
      {required this.id,
      required this.displayName,
      required this.pDoneId,
      this.fullName,
      this.birthday});

  factory _$MarshopUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarshopUserInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String displayName;
  @override
  final String pDoneId;
  @override
  final String? fullName;
  @override
  final String? birthday;

  @override
  String toString() {
    return 'MarshopUserInfo(id: $id, displayName: $displayName, pDoneId: $pDoneId, fullName: $fullName, birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopUserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayName, pDoneId, fullName, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopUserInfoImplCopyWith<_$MarshopUserInfoImpl> get copyWith =>
      __$$MarshopUserInfoImplCopyWithImpl<_$MarshopUserInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopUserInfoImplToJson(
      this,
    );
  }
}

abstract class _MarshopUserInfo implements MarshopUserInfo {
  const factory _MarshopUserInfo(
      {required final int id,
      required final String displayName,
      required final String pDoneId,
      final String? fullName,
      final String? birthday}) = _$MarshopUserInfoImpl;

  factory _MarshopUserInfo.fromJson(Map<String, dynamic> json) =
      _$MarshopUserInfoImpl.fromJson;

  @override
  int get id;
  @override
  String get displayName;
  @override
  String get pDoneId;
  @override
  String? get fullName;
  @override
  String? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$MarshopUserInfoImplCopyWith<_$MarshopUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
