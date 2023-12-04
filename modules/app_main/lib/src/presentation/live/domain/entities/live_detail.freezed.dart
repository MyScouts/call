// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) {
  return _LiveDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get agoraChannel => throw _privateConstructorUsedError;
  String? get agoraToken => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<LiveMedia>? get medias => throw _privateConstructorUsedError;
  List<LiveCategoryDetail>? get categories =>
      throw _privateConstructorUsedError;
  VirtualInfo? get virtualInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveDetailCopyWith<LiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveDetailCopyWith<$Res> {
  factory $LiveDetailCopyWith(
          LiveDetail value, $Res Function(LiveDetail) then) =
      _$LiveDetailCopyWithImpl<$Res, LiveDetail>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? createdAt,
      String? type,
      String? title,
      String? agoraChannel,
      String? agoraToken,
      User? user,
      List<LiveMedia>? medias,
      List<LiveCategoryDetail>? categories,
      VirtualInfo? virtualInfo});

  $UserCopyWith<$Res>? get user;
  $VirtualInfoCopyWith<$Res>? get virtualInfo;
}

/// @nodoc
class _$LiveDetailCopyWithImpl<$Res, $Val extends LiveDetail>
    implements $LiveDetailCopyWith<$Res> {
  _$LiveDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? agoraChannel = freezed,
    Object? agoraToken = freezed,
    Object? user = freezed,
    Object? medias = freezed,
    Object? categories = freezed,
    Object? virtualInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraChannel: freezed == agoraChannel
          ? _value.agoraChannel
          : agoraChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraToken: freezed == agoraToken
          ? _value.agoraToken
          : agoraToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      medias: freezed == medias
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<LiveMedia>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<LiveCategoryDetail>?,
      virtualInfo: freezed == virtualInfo
          ? _value.virtualInfo
          : virtualInfo // ignore: cast_nullable_to_non_nullable
              as VirtualInfo?,
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
  $VirtualInfoCopyWith<$Res>? get virtualInfo {
    if (_value.virtualInfo == null) {
      return null;
    }

    return $VirtualInfoCopyWith<$Res>(_value.virtualInfo!, (value) {
      return _then(_value.copyWith(virtualInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveDetailImplCopyWith<$Res>
    implements $LiveDetailCopyWith<$Res> {
  factory _$$LiveDetailImplCopyWith(
          _$LiveDetailImpl value, $Res Function(_$LiveDetailImpl) then) =
      __$$LiveDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? createdAt,
      String? type,
      String? title,
      String? agoraChannel,
      String? agoraToken,
      User? user,
      List<LiveMedia>? medias,
      List<LiveCategoryDetail>? categories,
      VirtualInfo? virtualInfo});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $VirtualInfoCopyWith<$Res>? get virtualInfo;
}

/// @nodoc
class __$$LiveDetailImplCopyWithImpl<$Res>
    extends _$LiveDetailCopyWithImpl<$Res, _$LiveDetailImpl>
    implements _$$LiveDetailImplCopyWith<$Res> {
  __$$LiveDetailImplCopyWithImpl(
      _$LiveDetailImpl _value, $Res Function(_$LiveDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? type = freezed,
    Object? title = freezed,
    Object? agoraChannel = freezed,
    Object? agoraToken = freezed,
    Object? user = freezed,
    Object? medias = freezed,
    Object? categories = freezed,
    Object? virtualInfo = freezed,
  }) {
    return _then(_$LiveDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraChannel: freezed == agoraChannel
          ? _value.agoraChannel
          : agoraChannel // ignore: cast_nullable_to_non_nullable
              as String?,
      agoraToken: freezed == agoraToken
          ? _value.agoraToken
          : agoraToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      medias: freezed == medias
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<LiveMedia>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<LiveCategoryDetail>?,
      virtualInfo: freezed == virtualInfo
          ? _value.virtualInfo
          : virtualInfo // ignore: cast_nullable_to_non_nullable
              as VirtualInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiveDetailImpl implements _LiveDetail {
  const _$LiveDetailImpl(
      {this.id,
      this.userId,
      this.createdAt,
      this.type,
      this.title,
      this.agoraChannel,
      this.agoraToken,
      this.user,
      final List<LiveMedia>? medias,
      final List<LiveCategoryDetail>? categories,
      this.virtualInfo})
      : _medias = medias,
        _categories = categories;

  factory _$LiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? createdAt;
  @override
  final String? type;
  @override
  final String? title;
  @override
  final String? agoraChannel;
  @override
  final String? agoraToken;
  @override
  final User? user;
  final List<LiveMedia>? _medias;
  @override
  List<LiveMedia>? get medias {
    final value = _medias;
    if (value == null) return null;
    if (_medias is EqualUnmodifiableListView) return _medias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LiveCategoryDetail>? _categories;
  @override
  List<LiveCategoryDetail>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final VirtualInfo? virtualInfo;

  @override
  String toString() {
    return 'LiveDetail(id: $id, userId: $userId, createdAt: $createdAt, type: $type, title: $title, agoraChannel: $agoraChannel, agoraToken: $agoraToken, user: $user, medias: $medias, categories: $categories, virtualInfo: $virtualInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.agoraChannel, agoraChannel) ||
                other.agoraChannel == agoraChannel) &&
            (identical(other.agoraToken, agoraToken) ||
                other.agoraToken == agoraToken) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.virtualInfo, virtualInfo) ||
                other.virtualInfo == virtualInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      createdAt,
      type,
      title,
      agoraChannel,
      agoraToken,
      user,
      const DeepCollectionEquality().hash(_medias),
      const DeepCollectionEquality().hash(_categories),
      virtualInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      __$$LiveDetailImplCopyWithImpl<_$LiveDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveDetailImplToJson(
      this,
    );
  }
}

abstract class _LiveDetail implements LiveDetail {
  const factory _LiveDetail(
      {final int? id,
      final int? userId,
      final String? createdAt,
      final String? type,
      final String? title,
      final String? agoraChannel,
      final String? agoraToken,
      final User? user,
      final List<LiveMedia>? medias,
      final List<LiveCategoryDetail>? categories,
      final VirtualInfo? virtualInfo}) = _$LiveDetailImpl;

  factory _LiveDetail.fromJson(Map<String, dynamic> json) =
      _$LiveDetailImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get createdAt;
  @override
  String? get type;
  @override
  String? get title;
  @override
  String? get agoraChannel;
  @override
  String? get agoraToken;
  @override
  User? get user;
  @override
  List<LiveMedia>? get medias;
  @override
  List<LiveCategoryDetail>? get categories;
  @override
  VirtualInfo? get virtualInfo;
  @override
  @JsonKey(ignore: true)
  _$$LiveDetailImplCopyWith<_$LiveDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
