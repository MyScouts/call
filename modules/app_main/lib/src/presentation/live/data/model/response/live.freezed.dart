// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Live _$LiveFromJson(Map<String, dynamic> json) {
  return _Live.fromJson(json);
}

/// @nodoc
mixin _$Live {
  List<LiveDetail>? get lives => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveCopyWith<Live> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveCopyWith<$Res> {
  factory $LiveCopyWith(Live value, $Res Function(Live) then) =
      _$LiveCopyWithImpl<$Res, Live>;
  @useResult
  $Res call({List<LiveDetail>? lives, int? total});
}

/// @nodoc
class _$LiveCopyWithImpl<$Res, $Val extends Live>
    implements $LiveCopyWith<$Res> {
  _$LiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lives = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      lives: freezed == lives
          ? _value.lives
          : lives // ignore: cast_nullable_to_non_nullable
              as List<LiveDetail>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveImplCopyWith<$Res> implements $LiveCopyWith<$Res> {
  factory _$$LiveImplCopyWith(
          _$LiveImpl value, $Res Function(_$LiveImpl) then) =
      __$$LiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiveDetail>? lives, int? total});
}

/// @nodoc
class __$$LiveImplCopyWithImpl<$Res>
    extends _$LiveCopyWithImpl<$Res, _$LiveImpl>
    implements _$$LiveImplCopyWith<$Res> {
  __$$LiveImplCopyWithImpl(_$LiveImpl _value, $Res Function(_$LiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lives = freezed,
    Object? total = freezed,
  }) {
    return _then(_$LiveImpl(
      lives: freezed == lives
          ? _value._lives
          : lives // ignore: cast_nullable_to_non_nullable
              as List<LiveDetail>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiveImpl implements _Live {
  const _$LiveImpl({final List<LiveDetail>? lives, this.total})
      : _lives = lives;

  factory _$LiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveImplFromJson(json);

  final List<LiveDetail>? _lives;
  @override
  List<LiveDetail>? get lives {
    final value = _lives;
    if (value == null) return null;
    if (_lives is EqualUnmodifiableListView) return _lives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;

  @override
  String toString() {
    return 'Live(lives: $lives, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveImpl &&
            const DeepCollectionEquality().equals(other._lives, _lives) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lives), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveImplCopyWith<_$LiveImpl> get copyWith =>
      __$$LiveImplCopyWithImpl<_$LiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveImplToJson(
      this,
    );
  }
}

abstract class _Live implements Live {
  const factory _Live({final List<LiveDetail>? lives, final int? total}) =
      _$LiveImpl;

  factory _Live.fromJson(Map<String, dynamic> json) = _$LiveImpl.fromJson;

  @override
  List<LiveDetail>? get lives;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$LiveImplCopyWith<_$LiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
