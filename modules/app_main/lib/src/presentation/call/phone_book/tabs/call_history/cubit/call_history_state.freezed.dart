// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CallHistoryState {
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
    TResult Function(CallHistoryStateData value) $default, {
    required TResult Function(CallHistoryStateLoading value) loading,
    required TResult Function(CallHistoryStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CallHistoryStateData value)? $default, {
    TResult? Function(CallHistoryStateLoading value)? loading,
    TResult? Function(CallHistoryStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CallHistoryStateData value)? $default, {
    TResult Function(CallHistoryStateLoading value)? loading,
    TResult Function(CallHistoryStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallHistoryStateCopyWith<$Res> {
  factory $CallHistoryStateCopyWith(
          CallHistoryState value, $Res Function(CallHistoryState) then) =
      _$CallHistoryStateCopyWithImpl<$Res, CallHistoryState>;
}

/// @nodoc
class _$CallHistoryStateCopyWithImpl<$Res, $Val extends CallHistoryState>
    implements $CallHistoryStateCopyWith<$Res> {
  _$CallHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CallHistoryStateDataImplCopyWith<$Res> {
  factory _$$CallHistoryStateDataImplCopyWith(_$CallHistoryStateDataImpl value,
          $Res Function(_$CallHistoryStateDataImpl) then) =
      __$$CallHistoryStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CallHistoryModel> data, bool canLoadMore, int page});
}

/// @nodoc
class __$$CallHistoryStateDataImplCopyWithImpl<$Res>
    extends _$CallHistoryStateCopyWithImpl<$Res, _$CallHistoryStateDataImpl>
    implements _$$CallHistoryStateDataImplCopyWith<$Res> {
  __$$CallHistoryStateDataImplCopyWithImpl(_$CallHistoryStateDataImpl _value,
      $Res Function(_$CallHistoryStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? canLoadMore = null,
    Object? page = null,
  }) {
    return _then(_$CallHistoryStateDataImpl(
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

class _$CallHistoryStateDataImpl implements CallHistoryStateData {
  const _$CallHistoryStateDataImpl(
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
    return 'CallHistoryState(data: $data, canLoadMore: $canLoadMore, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallHistoryStateDataImpl &&
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
  _$$CallHistoryStateDataImplCopyWith<_$CallHistoryStateDataImpl>
      get copyWith =>
          __$$CallHistoryStateDataImplCopyWithImpl<_$CallHistoryStateDataImpl>(
              this, _$identity);

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
    TResult Function(CallHistoryStateData value) $default, {
    required TResult Function(CallHistoryStateLoading value) loading,
    required TResult Function(CallHistoryStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CallHistoryStateData value)? $default, {
    TResult? Function(CallHistoryStateLoading value)? loading,
    TResult? Function(CallHistoryStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CallHistoryStateData value)? $default, {
    TResult Function(CallHistoryStateLoading value)? loading,
    TResult Function(CallHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CallHistoryStateData implements CallHistoryState {
  const factory CallHistoryStateData(
      {required final List<CallHistoryModel> data,
      required final bool canLoadMore,
      required final int page}) = _$CallHistoryStateDataImpl;

  List<CallHistoryModel> get data;
  bool get canLoadMore;
  int get page;
  @JsonKey(ignore: true)
  _$$CallHistoryStateDataImplCopyWith<_$CallHistoryStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CallHistoryStateLoadingImplCopyWith<$Res> {
  factory _$$CallHistoryStateLoadingImplCopyWith(
          _$CallHistoryStateLoadingImpl value,
          $Res Function(_$CallHistoryStateLoadingImpl) then) =
      __$$CallHistoryStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CallHistoryStateLoadingImplCopyWithImpl<$Res>
    extends _$CallHistoryStateCopyWithImpl<$Res, _$CallHistoryStateLoadingImpl>
    implements _$$CallHistoryStateLoadingImplCopyWith<$Res> {
  __$$CallHistoryStateLoadingImplCopyWithImpl(
      _$CallHistoryStateLoadingImpl _value,
      $Res Function(_$CallHistoryStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CallHistoryStateLoadingImpl implements CallHistoryStateLoading {
  const _$CallHistoryStateLoadingImpl();

  @override
  String toString() {
    return 'CallHistoryState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallHistoryStateLoadingImpl);
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
    TResult Function(CallHistoryStateData value) $default, {
    required TResult Function(CallHistoryStateLoading value) loading,
    required TResult Function(CallHistoryStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CallHistoryStateData value)? $default, {
    TResult? Function(CallHistoryStateLoading value)? loading,
    TResult? Function(CallHistoryStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CallHistoryStateData value)? $default, {
    TResult Function(CallHistoryStateLoading value)? loading,
    TResult Function(CallHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CallHistoryStateLoading implements CallHistoryState {
  const factory CallHistoryStateLoading() = _$CallHistoryStateLoadingImpl;
}

/// @nodoc
abstract class _$$CallHistoryStateErrorImplCopyWith<$Res> {
  factory _$$CallHistoryStateErrorImplCopyWith(
          _$CallHistoryStateErrorImpl value,
          $Res Function(_$CallHistoryStateErrorImpl) then) =
      __$$CallHistoryStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$CallHistoryStateErrorImplCopyWithImpl<$Res>
    extends _$CallHistoryStateCopyWithImpl<$Res, _$CallHistoryStateErrorImpl>
    implements _$$CallHistoryStateErrorImplCopyWith<$Res> {
  __$$CallHistoryStateErrorImplCopyWithImpl(_$CallHistoryStateErrorImpl _value,
      $Res Function(_$CallHistoryStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CallHistoryStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CallHistoryStateErrorImpl implements CallHistoryStateError {
  const _$CallHistoryStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CallHistoryState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallHistoryStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallHistoryStateErrorImplCopyWith<_$CallHistoryStateErrorImpl>
      get copyWith => __$$CallHistoryStateErrorImplCopyWithImpl<
          _$CallHistoryStateErrorImpl>(this, _$identity);

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
    TResult Function(CallHistoryStateData value) $default, {
    required TResult Function(CallHistoryStateLoading value) loading,
    required TResult Function(CallHistoryStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CallHistoryStateData value)? $default, {
    TResult? Function(CallHistoryStateLoading value)? loading,
    TResult? Function(CallHistoryStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CallHistoryStateData value)? $default, {
    TResult Function(CallHistoryStateLoading value)? loading,
    TResult Function(CallHistoryStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CallHistoryStateError implements CallHistoryState {
  const factory CallHistoryStateError(final dynamic error) =
      _$CallHistoryStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$CallHistoryStateErrorImplCopyWith<_$CallHistoryStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
