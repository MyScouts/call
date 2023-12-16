// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyGroupResponse _$MyGroupResponseFromJson(Map<String, dynamic> json) {
  return _MyGroupResponse.fromJson(json);
}

/// @nodoc
mixin _$MyGroupResponse {
  List<Group>? get groups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyGroupResponseCopyWith<MyGroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyGroupResponseCopyWith<$Res> {
  factory $MyGroupResponseCopyWith(
          MyGroupResponse value, $Res Function(MyGroupResponse) then) =
      _$MyGroupResponseCopyWithImpl<$Res, MyGroupResponse>;
  @useResult
  $Res call({List<Group>? groups});
}

/// @nodoc
class _$MyGroupResponseCopyWithImpl<$Res, $Val extends MyGroupResponse>
    implements $MyGroupResponseCopyWith<$Res> {
  _$MyGroupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_value.copyWith(
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyGroupResponseImplCopyWith<$Res>
    implements $MyGroupResponseCopyWith<$Res> {
  factory _$$MyGroupResponseImplCopyWith(_$MyGroupResponseImpl value,
          $Res Function(_$MyGroupResponseImpl) then) =
      __$$MyGroupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Group>? groups});
}

/// @nodoc
class __$$MyGroupResponseImplCopyWithImpl<$Res>
    extends _$MyGroupResponseCopyWithImpl<$Res, _$MyGroupResponseImpl>
    implements _$$MyGroupResponseImplCopyWith<$Res> {
  __$$MyGroupResponseImplCopyWithImpl(
      _$MyGroupResponseImpl _value, $Res Function(_$MyGroupResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groups = freezed,
  }) {
    return _then(_$MyGroupResponseImpl(
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyGroupResponseImpl implements _MyGroupResponse {
  const _$MyGroupResponseImpl({final List<Group>? groups}) : _groups = groups;

  factory _$MyGroupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyGroupResponseImplFromJson(json);

  final List<Group>? _groups;
  @override
  List<Group>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyGroupResponse(groups: $groups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyGroupResponseImpl &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyGroupResponseImplCopyWith<_$MyGroupResponseImpl> get copyWith =>
      __$$MyGroupResponseImplCopyWithImpl<_$MyGroupResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyGroupResponseImplToJson(
      this,
    );
  }
}

abstract class _MyGroupResponse implements MyGroupResponse {
  const factory _MyGroupResponse({final List<Group>? groups}) =
      _$MyGroupResponseImpl;

  factory _MyGroupResponse.fromJson(Map<String, dynamic> json) =
      _$MyGroupResponseImpl.fromJson;

  @override
  List<Group>? get groups;
  @override
  @JsonKey(ignore: true)
  _$$MyGroupResponseImplCopyWith<_$MyGroupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
