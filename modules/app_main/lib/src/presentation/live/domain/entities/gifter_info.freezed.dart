// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gifter_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiversInfo _$GiversInfoFromJson(Map<String, dynamic> json) {
  return _GiversInfo.fromJson(json);
}

/// @nodoc
mixin _$GiversInfo {
  User? get giver => throw _privateConstructorUsedError;
  int? get coinCount => throw _privateConstructorUsedError;
  Festival? get festivalUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiversInfoCopyWith<GiversInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiversInfoCopyWith<$Res> {
  factory $GiversInfoCopyWith(
          GiversInfo value, $Res Function(GiversInfo) then) =
      _$GiversInfoCopyWithImpl<$Res, GiversInfo>;
  @useResult
  $Res call({User? giver, int? coinCount, Festival? festivalUser});

  $UserCopyWith<$Res>? get giver;
  $FestivalCopyWith<$Res>? get festivalUser;
}

/// @nodoc
class _$GiversInfoCopyWithImpl<$Res, $Val extends GiversInfo>
    implements $GiversInfoCopyWith<$Res> {
  _$GiversInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giver = freezed,
    Object? coinCount = freezed,
    Object? festivalUser = freezed,
  }) {
    return _then(_value.copyWith(
      giver: freezed == giver
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as User?,
      coinCount: freezed == coinCount
          ? _value.coinCount
          : coinCount // ignore: cast_nullable_to_non_nullable
              as int?,
      festivalUser: freezed == festivalUser
          ? _value.festivalUser
          : festivalUser // ignore: cast_nullable_to_non_nullable
              as Festival?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get giver {
    if (_value.giver == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.giver!, (value) {
      return _then(_value.copyWith(giver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FestivalCopyWith<$Res>? get festivalUser {
    if (_value.festivalUser == null) {
      return null;
    }

    return $FestivalCopyWith<$Res>(_value.festivalUser!, (value) {
      return _then(_value.copyWith(festivalUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiversInfoImplCopyWith<$Res>
    implements $GiversInfoCopyWith<$Res> {
  factory _$$GiversInfoImplCopyWith(
          _$GiversInfoImpl value, $Res Function(_$GiversInfoImpl) then) =
      __$$GiversInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? giver, int? coinCount, Festival? festivalUser});

  @override
  $UserCopyWith<$Res>? get giver;
  @override
  $FestivalCopyWith<$Res>? get festivalUser;
}

/// @nodoc
class __$$GiversInfoImplCopyWithImpl<$Res>
    extends _$GiversInfoCopyWithImpl<$Res, _$GiversInfoImpl>
    implements _$$GiversInfoImplCopyWith<$Res> {
  __$$GiversInfoImplCopyWithImpl(
      _$GiversInfoImpl _value, $Res Function(_$GiversInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giver = freezed,
    Object? coinCount = freezed,
    Object? festivalUser = freezed,
  }) {
    return _then(_$GiversInfoImpl(
      giver: freezed == giver
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as User?,
      coinCount: freezed == coinCount
          ? _value.coinCount
          : coinCount // ignore: cast_nullable_to_non_nullable
              as int?,
      festivalUser: freezed == festivalUser
          ? _value.festivalUser
          : festivalUser // ignore: cast_nullable_to_non_nullable
              as Festival?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiversInfoImpl implements _GiversInfo {
  const _$GiversInfoImpl({this.giver, this.coinCount, this.festivalUser});

  factory _$GiversInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiversInfoImplFromJson(json);

  @override
  final User? giver;
  @override
  final int? coinCount;
  @override
  final Festival? festivalUser;

  @override
  String toString() {
    return 'GiversInfo(giver: $giver, coinCount: $coinCount, festivalUser: $festivalUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiversInfoImpl &&
            (identical(other.giver, giver) || other.giver == giver) &&
            (identical(other.coinCount, coinCount) ||
                other.coinCount == coinCount) &&
            (identical(other.festivalUser, festivalUser) ||
                other.festivalUser == festivalUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, giver, coinCount, festivalUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiversInfoImplCopyWith<_$GiversInfoImpl> get copyWith =>
      __$$GiversInfoImplCopyWithImpl<_$GiversInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiversInfoImplToJson(
      this,
    );
  }
}

abstract class _GiversInfo implements GiversInfo {
  const factory _GiversInfo(
      {final User? giver,
      final int? coinCount,
      final Festival? festivalUser}) = _$GiversInfoImpl;

  factory _GiversInfo.fromJson(Map<String, dynamic> json) =
      _$GiversInfoImpl.fromJson;

  @override
  User? get giver;
  @override
  int? get coinCount;
  @override
  Festival? get festivalUser;
  @override
  @JsonKey(ignore: true)
  _$$GiversInfoImplCopyWith<_$GiversInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
