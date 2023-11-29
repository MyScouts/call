// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_count_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberCountData _$MemberCountDataFromJson(Map<String, dynamic> json) {
  return _MemberCountData.fromJson(json);
}

/// @nodoc
mixin _$MemberCountData {
  List<LiveMemberCount> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCountDataCopyWith<MemberCountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCountDataCopyWith<$Res> {
  factory $MemberCountDataCopyWith(
          MemberCountData value, $Res Function(MemberCountData) then) =
      _$MemberCountDataCopyWithImpl<$Res, MemberCountData>;
  @useResult
  $Res call({List<LiveMemberCount> data});
}

/// @nodoc
class _$MemberCountDataCopyWithImpl<$Res, $Val extends MemberCountData>
    implements $MemberCountDataCopyWith<$Res> {
  _$MemberCountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveMemberCount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberCountDataImplCopyWith<$Res>
    implements $MemberCountDataCopyWith<$Res> {
  factory _$$MemberCountDataImplCopyWith(_$MemberCountDataImpl value,
          $Res Function(_$MemberCountDataImpl) then) =
      __$$MemberCountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiveMemberCount> data});
}

/// @nodoc
class __$$MemberCountDataImplCopyWithImpl<$Res>
    extends _$MemberCountDataCopyWithImpl<$Res, _$MemberCountDataImpl>
    implements _$$MemberCountDataImplCopyWith<$Res> {
  __$$MemberCountDataImplCopyWithImpl(
      _$MemberCountDataImpl _value, $Res Function(_$MemberCountDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MemberCountDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveMemberCount>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MemberCountDataImpl implements _MemberCountData {
  const _$MemberCountDataImpl({required final List<LiveMemberCount> data})
      : _data = data;

  factory _$MemberCountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberCountDataImplFromJson(json);

  final List<LiveMemberCount> _data;
  @override
  List<LiveMemberCount> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MemberCountData(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberCountDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberCountDataImplCopyWith<_$MemberCountDataImpl> get copyWith =>
      __$$MemberCountDataImplCopyWithImpl<_$MemberCountDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberCountDataImplToJson(
      this,
    );
  }
}

abstract class _MemberCountData implements MemberCountData {
  const factory _MemberCountData({required final List<LiveMemberCount> data}) =
      _$MemberCountDataImpl;

  factory _MemberCountData.fromJson(Map<String, dynamic> json) =
      _$MemberCountDataImpl.fromJson;

  @override
  List<LiveMemberCount> get data;
  @override
  @JsonKey(ignore: true)
  _$$MemberCountDataImplCopyWith<_$MemberCountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
