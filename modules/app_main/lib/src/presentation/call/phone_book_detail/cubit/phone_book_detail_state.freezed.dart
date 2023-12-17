// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_book_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhoneBookDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value) $default, {
    required TResult Function(PhoneBookDetailStateLoading value) loading,
    required TResult Function(PhoneBookDetailStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneBookDetailStateData value)? $default, {
    TResult? Function(PhoneBookDetailStateLoading value)? loading,
    TResult? Function(PhoneBookDetailStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value)? $default, {
    TResult Function(PhoneBookDetailStateLoading value)? loading,
    TResult Function(PhoneBookDetailStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneBookDetailStateCopyWith<$Res> {
  factory $PhoneBookDetailStateCopyWith(PhoneBookDetailState value,
          $Res Function(PhoneBookDetailState) then) =
      _$PhoneBookDetailStateCopyWithImpl<$Res, PhoneBookDetailState>;
}

/// @nodoc
class _$PhoneBookDetailStateCopyWithImpl<$Res,
        $Val extends PhoneBookDetailState>
    implements $PhoneBookDetailStateCopyWith<$Res> {
  _$PhoneBookDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PhoneBookDetailStateDataImplCopyWith<$Res> {
  factory _$$PhoneBookDetailStateDataImplCopyWith(
          _$PhoneBookDetailStateDataImpl value,
          $Res Function(_$PhoneBookDetailStateDataImpl) then) =
      __$$PhoneBookDetailStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CallHistoryModel> data, bool canLoadMore, int page});
}

/// @nodoc
class __$$PhoneBookDetailStateDataImplCopyWithImpl<$Res>
    extends _$PhoneBookDetailStateCopyWithImpl<$Res,
        _$PhoneBookDetailStateDataImpl>
    implements _$$PhoneBookDetailStateDataImplCopyWith<$Res> {
  __$$PhoneBookDetailStateDataImplCopyWithImpl(
      _$PhoneBookDetailStateDataImpl _value,
      $Res Function(_$PhoneBookDetailStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? canLoadMore = null,
    Object? page = null,
  }) {
    return _then(_$PhoneBookDetailStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CallHistoryModel>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PhoneBookDetailStateDataImpl implements PhoneBookDetailStateData {
  const _$PhoneBookDetailStateDataImpl(
      {required final List<CallHistoryModel> data,
      required this.canLoadMore,
      required this.page})
      : _data = data;

  final List<CallHistoryModel> _data;
  @override
  List<CallHistoryModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final bool canLoadMore;
  @override
  final int page;

  @override
  String toString() {
    return 'PhoneBookDetailState(data: $data, canLoadMore: $canLoadMore, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneBookDetailStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), canLoadMore, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneBookDetailStateDataImplCopyWith<_$PhoneBookDetailStateDataImpl>
      get copyWith => __$$PhoneBookDetailStateDataImplCopyWithImpl<
          _$PhoneBookDetailStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(data, canLoadMore, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(data, canLoadMore, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data, canLoadMore, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value) $default, {
    required TResult Function(PhoneBookDetailStateLoading value) loading,
    required TResult Function(PhoneBookDetailStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneBookDetailStateData value)? $default, {
    TResult? Function(PhoneBookDetailStateLoading value)? loading,
    TResult? Function(PhoneBookDetailStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value)? $default, {
    TResult Function(PhoneBookDetailStateLoading value)? loading,
    TResult Function(PhoneBookDetailStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class PhoneBookDetailStateData implements PhoneBookDetailState {
  const factory PhoneBookDetailStateData(
      {required final List<CallHistoryModel> data,
      required final bool canLoadMore,
      required final int page}) = _$PhoneBookDetailStateDataImpl;

  List<CallHistoryModel> get data;
  bool get canLoadMore;
  int get page;
  @JsonKey(ignore: true)
  _$$PhoneBookDetailStateDataImplCopyWith<_$PhoneBookDetailStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneBookDetailStateLoadingImplCopyWith<$Res> {
  factory _$$PhoneBookDetailStateLoadingImplCopyWith(
          _$PhoneBookDetailStateLoadingImpl value,
          $Res Function(_$PhoneBookDetailStateLoadingImpl) then) =
      __$$PhoneBookDetailStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PhoneBookDetailStateLoadingImplCopyWithImpl<$Res>
    extends _$PhoneBookDetailStateCopyWithImpl<$Res,
        _$PhoneBookDetailStateLoadingImpl>
    implements _$$PhoneBookDetailStateLoadingImplCopyWith<$Res> {
  __$$PhoneBookDetailStateLoadingImplCopyWithImpl(
      _$PhoneBookDetailStateLoadingImpl _value,
      $Res Function(_$PhoneBookDetailStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PhoneBookDetailStateLoadingImpl implements PhoneBookDetailStateLoading {
  const _$PhoneBookDetailStateLoadingImpl();

  @override
  String toString() {
    return 'PhoneBookDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneBookDetailStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value) $default, {
    required TResult Function(PhoneBookDetailStateLoading value) loading,
    required TResult Function(PhoneBookDetailStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneBookDetailStateData value)? $default, {
    TResult? Function(PhoneBookDetailStateLoading value)? loading,
    TResult? Function(PhoneBookDetailStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value)? $default, {
    TResult Function(PhoneBookDetailStateLoading value)? loading,
    TResult Function(PhoneBookDetailStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PhoneBookDetailStateLoading implements PhoneBookDetailState {
  const factory PhoneBookDetailStateLoading() =
      _$PhoneBookDetailStateLoadingImpl;
}

/// @nodoc
abstract class _$$PhoneBookDetailStateErrorImplCopyWith<$Res> {
  factory _$$PhoneBookDetailStateErrorImplCopyWith(
          _$PhoneBookDetailStateErrorImpl value,
          $Res Function(_$PhoneBookDetailStateErrorImpl) then) =
      __$$PhoneBookDetailStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$PhoneBookDetailStateErrorImplCopyWithImpl<$Res>
    extends _$PhoneBookDetailStateCopyWithImpl<$Res,
        _$PhoneBookDetailStateErrorImpl>
    implements _$$PhoneBookDetailStateErrorImplCopyWith<$Res> {
  __$$PhoneBookDetailStateErrorImplCopyWithImpl(
      _$PhoneBookDetailStateErrorImpl _value,
      $Res Function(_$PhoneBookDetailStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PhoneBookDetailStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$PhoneBookDetailStateErrorImpl implements PhoneBookDetailStateError {
  const _$PhoneBookDetailStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'PhoneBookDetailState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneBookDetailStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneBookDetailStateErrorImplCopyWith<_$PhoneBookDetailStateErrorImpl>
      get copyWith => __$$PhoneBookDetailStateErrorImplCopyWithImpl<
          _$PhoneBookDetailStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<CallHistoryModel> data, bool canLoadMore, int page)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value) $default, {
    required TResult Function(PhoneBookDetailStateLoading value) loading,
    required TResult Function(PhoneBookDetailStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(PhoneBookDetailStateData value)? $default, {
    TResult? Function(PhoneBookDetailStateLoading value)? loading,
    TResult? Function(PhoneBookDetailStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(PhoneBookDetailStateData value)? $default, {
    TResult Function(PhoneBookDetailStateLoading value)? loading,
    TResult Function(PhoneBookDetailStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PhoneBookDetailStateError implements PhoneBookDetailState {
  const factory PhoneBookDetailStateError(final dynamic error) =
      _$PhoneBookDetailStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$PhoneBookDetailStateErrorImplCopyWith<_$PhoneBookDetailStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
