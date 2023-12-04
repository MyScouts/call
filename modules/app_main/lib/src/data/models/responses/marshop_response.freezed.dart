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
  List<MarshopResponse> get marshops => throw _privateConstructorUsedError;

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
  $Res call({int total, List<MarshopResponse> marshops});
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
              as List<MarshopResponse>,
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
  $Res call({int total, List<MarshopResponse> marshops});
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
              as List<MarshopResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListMarshopResponseImpl implements _ListMarshopResponse {
  const _$ListMarshopResponseImpl(
      {required this.total, required final List<MarshopResponse> marshops})
      : _marshops = marshops;

  factory _$ListMarshopResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListMarshopResponseImplFromJson(json);

  @override
  final int total;
  final List<MarshopResponse> _marshops;
  @override
  List<MarshopResponse> get marshops {
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
          required final List<MarshopResponse> marshops}) =
      _$ListMarshopResponseImpl;

  factory _ListMarshopResponse.fromJson(Map<String, dynamic> json) =
      _$ListMarshopResponseImpl.fromJson;

  @override
  int get total;
  @override
  List<MarshopResponse> get marshops;
  @override
  @JsonKey(ignore: true)
  _$$ListMarshopResponseImplCopyWith<_$ListMarshopResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarshopResponse _$MarshopResponseFromJson(Map<String, dynamic> json) {
  return _MarshopResponse.fromJson(json);
}

/// @nodoc
mixin _$MarshopResponse {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  MarshopUserInfo get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopResponseCopyWith<MarshopResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopResponseCopyWith<$Res> {
  factory $MarshopResponseCopyWith(
          MarshopResponse value, $Res Function(MarshopResponse) then) =
      _$MarshopResponseCopyWithImpl<$Res, MarshopResponse>;
  @useResult
  $Res call({int id, String? name, String code, MarshopUserInfo user});

  $MarshopUserInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$MarshopResponseCopyWithImpl<$Res, $Val extends MarshopResponse>
    implements $MarshopResponseCopyWith<$Res> {
  _$MarshopResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$MarshopResponseImplCopyWith<$Res>
    implements $MarshopResponseCopyWith<$Res> {
  factory _$$MarshopResponseImplCopyWith(_$MarshopResponseImpl value,
          $Res Function(_$MarshopResponseImpl) then) =
      __$$MarshopResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name, String code, MarshopUserInfo user});

  @override
  $MarshopUserInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$MarshopResponseImplCopyWithImpl<$Res>
    extends _$MarshopResponseCopyWithImpl<$Res, _$MarshopResponseImpl>
    implements _$$MarshopResponseImplCopyWith<$Res> {
  __$$MarshopResponseImplCopyWithImpl(
      _$MarshopResponseImpl _value, $Res Function(_$MarshopResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? code = null,
    Object? user = null,
  }) {
    return _then(_$MarshopResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$MarshopResponseImpl implements _MarshopResponse {
  const _$MarshopResponseImpl(
      {required this.id, this.name, required this.code, required this.user});

  factory _$MarshopResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarshopResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String code;
  @override
  final MarshopUserInfo user;

  @override
  String toString() {
    return 'MarshopResponse(id: $id, name: $name, code: $code, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopResponseImpl &&
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
  _$$MarshopResponseImplCopyWith<_$MarshopResponseImpl> get copyWith =>
      __$$MarshopResponseImplCopyWithImpl<_$MarshopResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopResponseImplToJson(
      this,
    );
  }
}

abstract class _MarshopResponse implements MarshopResponse {
  const factory _MarshopResponse(
      {required final int id,
      final String? name,
      required final String code,
      required final MarshopUserInfo user}) = _$MarshopResponseImpl;

  factory _MarshopResponse.fromJson(Map<String, dynamic> json) =
      _$MarshopResponseImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String get code;
  @override
  MarshopUserInfo get user;
  @override
  @JsonKey(ignore: true)
  _$$MarshopResponseImplCopyWith<_$MarshopResponseImpl> get copyWith =>
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

MarshopRegisterPacksResponse _$MarshopRegisterPacksResponseFromJson(
    Map<String, dynamic> json) {
  return _MarshopRegisterPacksResponse.fromJson(json);
}

/// @nodoc
mixin _$MarshopRegisterPacksResponse {
  List<MarshopRegisterPackResponse> get packs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopRegisterPacksResponseCopyWith<MarshopRegisterPacksResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopRegisterPacksResponseCopyWith<$Res> {
  factory $MarshopRegisterPacksResponseCopyWith(
          MarshopRegisterPacksResponse value,
          $Res Function(MarshopRegisterPacksResponse) then) =
      _$MarshopRegisterPacksResponseCopyWithImpl<$Res,
          MarshopRegisterPacksResponse>;
  @useResult
  $Res call({List<MarshopRegisterPackResponse> packs});
}

/// @nodoc
class _$MarshopRegisterPacksResponseCopyWithImpl<$Res,
        $Val extends MarshopRegisterPacksResponse>
    implements $MarshopRegisterPacksResponseCopyWith<$Res> {
  _$MarshopRegisterPacksResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packs = null,
  }) {
    return _then(_value.copyWith(
      packs: null == packs
          ? _value.packs
          : packs // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarshopRegisterPacksResponseImplCopyWith<$Res>
    implements $MarshopRegisterPacksResponseCopyWith<$Res> {
  factory _$$MarshopRegisterPacksResponseImplCopyWith(
          _$MarshopRegisterPacksResponseImpl value,
          $Res Function(_$MarshopRegisterPacksResponseImpl) then) =
      __$$MarshopRegisterPacksResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MarshopRegisterPackResponse> packs});
}

/// @nodoc
class __$$MarshopRegisterPacksResponseImplCopyWithImpl<$Res>
    extends _$MarshopRegisterPacksResponseCopyWithImpl<$Res,
        _$MarshopRegisterPacksResponseImpl>
    implements _$$MarshopRegisterPacksResponseImplCopyWith<$Res> {
  __$$MarshopRegisterPacksResponseImplCopyWithImpl(
      _$MarshopRegisterPacksResponseImpl _value,
      $Res Function(_$MarshopRegisterPacksResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packs = null,
  }) {
    return _then(_$MarshopRegisterPacksResponseImpl(
      packs: null == packs
          ? _value._packs
          : packs // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarshopRegisterPacksResponseImpl
    implements _MarshopRegisterPacksResponse {
  const _$MarshopRegisterPacksResponseImpl(
      {required final List<MarshopRegisterPackResponse> packs})
      : _packs = packs;

  factory _$MarshopRegisterPacksResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MarshopRegisterPacksResponseImplFromJson(json);

  final List<MarshopRegisterPackResponse> _packs;
  @override
  List<MarshopRegisterPackResponse> get packs {
    if (_packs is EqualUnmodifiableListView) return _packs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packs);
  }

  @override
  String toString() {
    return 'MarshopRegisterPacksResponse(packs: $packs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopRegisterPacksResponseImpl &&
            const DeepCollectionEquality().equals(other._packs, _packs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_packs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopRegisterPacksResponseImplCopyWith<
          _$MarshopRegisterPacksResponseImpl>
      get copyWith => __$$MarshopRegisterPacksResponseImplCopyWithImpl<
          _$MarshopRegisterPacksResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopRegisterPacksResponseImplToJson(
      this,
    );
  }
}

abstract class _MarshopRegisterPacksResponse
    implements MarshopRegisterPacksResponse {
  const factory _MarshopRegisterPacksResponse(
          {required final List<MarshopRegisterPackResponse> packs}) =
      _$MarshopRegisterPacksResponseImpl;

  factory _MarshopRegisterPacksResponse.fromJson(Map<String, dynamic> json) =
      _$MarshopRegisterPacksResponseImpl.fromJson;

  @override
  List<MarshopRegisterPackResponse> get packs;
  @override
  @JsonKey(ignore: true)
  _$$MarshopRegisterPacksResponseImplCopyWith<
          _$MarshopRegisterPacksResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MarshopRegisterPackResponse _$MarshopRegisterPackResponseFromJson(
    Map<String, dynamic> json) {
  return _MarshopRegisterPackResponse.fromJson(json);
}

/// @nodoc
mixin _$MarshopRegisterPackResponse {
  int get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<MarshopRegisterPackRule> get rules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopRegisterPackResponseCopyWith<MarshopRegisterPackResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopRegisterPackResponseCopyWith<$Res> {
  factory $MarshopRegisterPackResponseCopyWith(
          MarshopRegisterPackResponse value,
          $Res Function(MarshopRegisterPackResponse) then) =
      _$MarshopRegisterPackResponseCopyWithImpl<$Res,
          MarshopRegisterPackResponse>;
  @useResult
  $Res call(
      {int id, int price, String name, List<MarshopRegisterPackRule> rules});
}

/// @nodoc
class _$MarshopRegisterPackResponseCopyWithImpl<$Res,
        $Val extends MarshopRegisterPackResponse>
    implements $MarshopRegisterPackResponseCopyWith<$Res> {
  _$MarshopRegisterPackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? name = null,
    Object? rules = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rules: null == rules
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackRule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarshopRegisterPackResponseImplCopyWith<$Res>
    implements $MarshopRegisterPackResponseCopyWith<$Res> {
  factory _$$MarshopRegisterPackResponseImplCopyWith(
          _$MarshopRegisterPackResponseImpl value,
          $Res Function(_$MarshopRegisterPackResponseImpl) then) =
      __$$MarshopRegisterPackResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int price, String name, List<MarshopRegisterPackRule> rules});
}

/// @nodoc
class __$$MarshopRegisterPackResponseImplCopyWithImpl<$Res>
    extends _$MarshopRegisterPackResponseCopyWithImpl<$Res,
        _$MarshopRegisterPackResponseImpl>
    implements _$$MarshopRegisterPackResponseImplCopyWith<$Res> {
  __$$MarshopRegisterPackResponseImplCopyWithImpl(
      _$MarshopRegisterPackResponseImpl _value,
      $Res Function(_$MarshopRegisterPackResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? name = null,
    Object? rules = null,
  }) {
    return _then(_$MarshopRegisterPackResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackRule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarshopRegisterPackResponseImpl
    implements _MarshopRegisterPackResponse {
  const _$MarshopRegisterPackResponseImpl(
      {required this.id,
      required this.price,
      required this.name,
      required final List<MarshopRegisterPackRule> rules})
      : _rules = rules;

  factory _$MarshopRegisterPackResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MarshopRegisterPackResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int price;
  @override
  final String name;
  final List<MarshopRegisterPackRule> _rules;
  @override
  List<MarshopRegisterPackRule> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  String toString() {
    return 'MarshopRegisterPackResponse(id: $id, price: $price, name: $name, rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopRegisterPackResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, name,
      const DeepCollectionEquality().hash(_rules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopRegisterPackResponseImplCopyWith<_$MarshopRegisterPackResponseImpl>
      get copyWith => __$$MarshopRegisterPackResponseImplCopyWithImpl<
          _$MarshopRegisterPackResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopRegisterPackResponseImplToJson(
      this,
    );
  }
}

abstract class _MarshopRegisterPackResponse
    implements MarshopRegisterPackResponse {
  const factory _MarshopRegisterPackResponse(
          {required final int id,
          required final int price,
          required final String name,
          required final List<MarshopRegisterPackRule> rules}) =
      _$MarshopRegisterPackResponseImpl;

  factory _MarshopRegisterPackResponse.fromJson(Map<String, dynamic> json) =
      _$MarshopRegisterPackResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get price;
  @override
  String get name;
  @override
  List<MarshopRegisterPackRule> get rules;
  @override
  @JsonKey(ignore: true)
  _$$MarshopRegisterPackResponseImplCopyWith<_$MarshopRegisterPackResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MarshopRegisterPackRule _$MarshopRegisterPackRuleFromJson(
    Map<String, dynamic> json) {
  return _MarshopRegisterPackRule.fromJson(json);
}

/// @nodoc
mixin _$MarshopRegisterPackRule {
  int get quantity => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<MarshopRegisterPackProduct> get products =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopRegisterPackRuleCopyWith<MarshopRegisterPackRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopRegisterPackRuleCopyWith<$Res> {
  factory $MarshopRegisterPackRuleCopyWith(MarshopRegisterPackRule value,
          $Res Function(MarshopRegisterPackRule) then) =
      _$MarshopRegisterPackRuleCopyWithImpl<$Res, MarshopRegisterPackRule>;
  @useResult
  $Res call(
      {int quantity,
      String title,
      String content,
      List<MarshopRegisterPackProduct> products});
}

/// @nodoc
class _$MarshopRegisterPackRuleCopyWithImpl<$Res,
        $Val extends MarshopRegisterPackRule>
    implements $MarshopRegisterPackRuleCopyWith<$Res> {
  _$MarshopRegisterPackRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? title = null,
    Object? content = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarshopRegisterPackRuleImplCopyWith<$Res>
    implements $MarshopRegisterPackRuleCopyWith<$Res> {
  factory _$$MarshopRegisterPackRuleImplCopyWith(
          _$MarshopRegisterPackRuleImpl value,
          $Res Function(_$MarshopRegisterPackRuleImpl) then) =
      __$$MarshopRegisterPackRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int quantity,
      String title,
      String content,
      List<MarshopRegisterPackProduct> products});
}

/// @nodoc
class __$$MarshopRegisterPackRuleImplCopyWithImpl<$Res>
    extends _$MarshopRegisterPackRuleCopyWithImpl<$Res,
        _$MarshopRegisterPackRuleImpl>
    implements _$$MarshopRegisterPackRuleImplCopyWith<$Res> {
  __$$MarshopRegisterPackRuleImplCopyWithImpl(
      _$MarshopRegisterPackRuleImpl _value,
      $Res Function(_$MarshopRegisterPackRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? title = null,
    Object? content = null,
    Object? products = null,
  }) {
    return _then(_$MarshopRegisterPackRuleImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MarshopRegisterPackProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarshopRegisterPackRuleImpl implements _MarshopRegisterPackRule {
  const _$MarshopRegisterPackRuleImpl(
      {required this.quantity,
      required this.title,
      required this.content,
      required final List<MarshopRegisterPackProduct> products})
      : _products = products;

  factory _$MarshopRegisterPackRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarshopRegisterPackRuleImplFromJson(json);

  @override
  final int quantity;
  @override
  final String title;
  @override
  final String content;
  final List<MarshopRegisterPackProduct> _products;
  @override
  List<MarshopRegisterPackProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'MarshopRegisterPackRule(quantity: $quantity, title: $title, content: $content, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopRegisterPackRuleImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, title, content,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopRegisterPackRuleImplCopyWith<_$MarshopRegisterPackRuleImpl>
      get copyWith => __$$MarshopRegisterPackRuleImplCopyWithImpl<
          _$MarshopRegisterPackRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopRegisterPackRuleImplToJson(
      this,
    );
  }
}

abstract class _MarshopRegisterPackRule implements MarshopRegisterPackRule {
  const factory _MarshopRegisterPackRule(
          {required final int quantity,
          required final String title,
          required final String content,
          required final List<MarshopRegisterPackProduct> products}) =
      _$MarshopRegisterPackRuleImpl;

  factory _MarshopRegisterPackRule.fromJson(Map<String, dynamic> json) =
      _$MarshopRegisterPackRuleImpl.fromJson;

  @override
  int get quantity;
  @override
  String get title;
  @override
  String get content;
  @override
  List<MarshopRegisterPackProduct> get products;
  @override
  @JsonKey(ignore: true)
  _$$MarshopRegisterPackRuleImplCopyWith<_$MarshopRegisterPackRuleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MarshopRegisterPackProduct _$MarshopRegisterPackProductFromJson(
    Map<String, dynamic> json) {
  return _MarshopRegisterPackProduct.fromJson(json);
}

/// @nodoc
mixin _$MarshopRegisterPackProduct {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarshopRegisterPackProductCopyWith<MarshopRegisterPackProduct>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarshopRegisterPackProductCopyWith<$Res> {
  factory $MarshopRegisterPackProductCopyWith(MarshopRegisterPackProduct value,
          $Res Function(MarshopRegisterPackProduct) then) =
      _$MarshopRegisterPackProductCopyWithImpl<$Res,
          MarshopRegisterPackProduct>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MarshopRegisterPackProductCopyWithImpl<$Res,
        $Val extends MarshopRegisterPackProduct>
    implements $MarshopRegisterPackProductCopyWith<$Res> {
  _$MarshopRegisterPackProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarshopRegisterPackProductImplCopyWith<$Res>
    implements $MarshopRegisterPackProductCopyWith<$Res> {
  factory _$$MarshopRegisterPackProductImplCopyWith(
          _$MarshopRegisterPackProductImpl value,
          $Res Function(_$MarshopRegisterPackProductImpl) then) =
      __$$MarshopRegisterPackProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MarshopRegisterPackProductImplCopyWithImpl<$Res>
    extends _$MarshopRegisterPackProductCopyWithImpl<$Res,
        _$MarshopRegisterPackProductImpl>
    implements _$$MarshopRegisterPackProductImplCopyWith<$Res> {
  __$$MarshopRegisterPackProductImplCopyWithImpl(
      _$MarshopRegisterPackProductImpl _value,
      $Res Function(_$MarshopRegisterPackProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MarshopRegisterPackProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarshopRegisterPackProductImpl implements _MarshopRegisterPackProduct {
  const _$MarshopRegisterPackProductImpl({required this.id});

  factory _$MarshopRegisterPackProductImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MarshopRegisterPackProductImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MarshopRegisterPackProduct(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarshopRegisterPackProductImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarshopRegisterPackProductImplCopyWith<_$MarshopRegisterPackProductImpl>
      get copyWith => __$$MarshopRegisterPackProductImplCopyWithImpl<
          _$MarshopRegisterPackProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarshopRegisterPackProductImplToJson(
      this,
    );
  }
}

abstract class _MarshopRegisterPackProduct
    implements MarshopRegisterPackProduct {
  const factory _MarshopRegisterPackProduct({required final String id}) =
      _$MarshopRegisterPackProductImpl;

  factory _MarshopRegisterPackProduct.fromJson(Map<String, dynamic> json) =
      _$MarshopRegisterPackProductImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$MarshopRegisterPackProductImplCopyWith<_$MarshopRegisterPackProductImpl>
      get copyWith => throw _privateConstructorUsedError;
}
