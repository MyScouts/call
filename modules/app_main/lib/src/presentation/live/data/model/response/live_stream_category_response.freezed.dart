// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_stream_category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveStreamCategoryResponse _$LiveStreamCategoryResponseFromJson(
    Map<String, dynamic> json) {
  return _LiveStreamCategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$LiveStreamCategoryResponse {
  List<LiveCategoryDetail>? get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveStreamCategoryResponseCopyWith<LiveStreamCategoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStreamCategoryResponseCopyWith<$Res> {
  factory $LiveStreamCategoryResponseCopyWith(LiveStreamCategoryResponse value,
          $Res Function(LiveStreamCategoryResponse) then) =
      _$LiveStreamCategoryResponseCopyWithImpl<$Res,
          LiveStreamCategoryResponse>;
  @useResult
  $Res call({List<LiveCategoryDetail>? categories});
}

/// @nodoc
class _$LiveStreamCategoryResponseCopyWithImpl<$Res,
        $Val extends LiveStreamCategoryResponse>
    implements $LiveStreamCategoryResponseCopyWith<$Res> {
  _$LiveStreamCategoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<LiveCategoryDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveStreamCategoryResponseImplCopyWith<$Res>
    implements $LiveStreamCategoryResponseCopyWith<$Res> {
  factory _$$LiveStreamCategoryResponseImplCopyWith(
          _$LiveStreamCategoryResponseImpl value,
          $Res Function(_$LiveStreamCategoryResponseImpl) then) =
      __$$LiveStreamCategoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiveCategoryDetail>? categories});
}

/// @nodoc
class __$$LiveStreamCategoryResponseImplCopyWithImpl<$Res>
    extends _$LiveStreamCategoryResponseCopyWithImpl<$Res,
        _$LiveStreamCategoryResponseImpl>
    implements _$$LiveStreamCategoryResponseImplCopyWith<$Res> {
  __$$LiveStreamCategoryResponseImplCopyWithImpl(
      _$LiveStreamCategoryResponseImpl _value,
      $Res Function(_$LiveStreamCategoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$LiveStreamCategoryResponseImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<LiveCategoryDetail>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiveStreamCategoryResponseImpl implements _LiveStreamCategoryResponse {
  const _$LiveStreamCategoryResponseImpl(
      {final List<LiveCategoryDetail>? categories})
      : _categories = categories;

  factory _$LiveStreamCategoryResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LiveStreamCategoryResponseImplFromJson(json);

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
  String toString() {
    return 'LiveStreamCategoryResponse(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStreamCategoryResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStreamCategoryResponseImplCopyWith<_$LiveStreamCategoryResponseImpl>
      get copyWith => __$$LiveStreamCategoryResponseImplCopyWithImpl<
          _$LiveStreamCategoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveStreamCategoryResponseImplToJson(
      this,
    );
  }
}

abstract class _LiveStreamCategoryResponse
    implements LiveStreamCategoryResponse {
  const factory _LiveStreamCategoryResponse(
          {final List<LiveCategoryDetail>? categories}) =
      _$LiveStreamCategoryResponseImpl;

  factory _LiveStreamCategoryResponse.fromJson(Map<String, dynamic> json) =
      _$LiveStreamCategoryResponseImpl.fromJson;

  @override
  List<LiveCategoryDetail>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$LiveStreamCategoryResponseImplCopyWith<_$LiveStreamCategoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
