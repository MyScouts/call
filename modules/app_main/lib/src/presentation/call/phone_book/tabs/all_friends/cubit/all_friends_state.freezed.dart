// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_friends_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllFriendsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AllFriendsStateData value) $default, {
    required TResult Function(AllFriendsStateLoading value) loading,
    required TResult Function(AllFriendsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AllFriendsStateData value)? $default, {
    TResult? Function(AllFriendsStateLoading value)? loading,
    TResult? Function(AllFriendsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AllFriendsStateData value)? $default, {
    TResult Function(AllFriendsStateLoading value)? loading,
    TResult Function(AllFriendsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllFriendsStateCopyWith<$Res> {
  factory $AllFriendsStateCopyWith(
          AllFriendsState value, $Res Function(AllFriendsState) then) =
      _$AllFriendsStateCopyWithImpl<$Res, AllFriendsState>;
}

/// @nodoc
class _$AllFriendsStateCopyWithImpl<$Res, $Val extends AllFriendsState>
    implements $AllFriendsStateCopyWith<$Res> {
  _$AllFriendsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AllFriendsStateDataImplCopyWith<$Res> {
  factory _$$AllFriendsStateDataImplCopyWith(_$AllFriendsStateDataImpl value,
          $Res Function(_$AllFriendsStateDataImpl) then) =
      __$$AllFriendsStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MemberModel> data, bool canLoadMore, int page});
}

/// @nodoc
class __$$AllFriendsStateDataImplCopyWithImpl<$Res>
    extends _$AllFriendsStateCopyWithImpl<$Res, _$AllFriendsStateDataImpl>
    implements _$$AllFriendsStateDataImplCopyWith<$Res> {
  __$$AllFriendsStateDataImplCopyWithImpl(_$AllFriendsStateDataImpl _value,
      $Res Function(_$AllFriendsStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? canLoadMore = null,
    Object? page = null,
  }) {
    return _then(_$AllFriendsStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
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

class _$AllFriendsStateDataImpl implements AllFriendsStateData {
  const _$AllFriendsStateDataImpl(
      {required final List<MemberModel> data,
      required this.canLoadMore,
      required this.page})
      : _data = data;

  final List<MemberModel> _data;
  @override
  List<MemberModel> get data {
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
    return 'AllFriendsState(data: $data, canLoadMore: $canLoadMore, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllFriendsStateDataImpl &&
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
  _$$AllFriendsStateDataImplCopyWith<_$AllFriendsStateDataImpl> get copyWith =>
      __$$AllFriendsStateDataImplCopyWithImpl<_$AllFriendsStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(data, canLoadMore, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(data, canLoadMore, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)?
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
    TResult Function(AllFriendsStateData value) $default, {
    required TResult Function(AllFriendsStateLoading value) loading,
    required TResult Function(AllFriendsStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AllFriendsStateData value)? $default, {
    TResult? Function(AllFriendsStateLoading value)? loading,
    TResult? Function(AllFriendsStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AllFriendsStateData value)? $default, {
    TResult Function(AllFriendsStateLoading value)? loading,
    TResult Function(AllFriendsStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AllFriendsStateData implements AllFriendsState {
  const factory AllFriendsStateData(
      {required final List<MemberModel> data,
      required final bool canLoadMore,
      required final int page}) = _$AllFriendsStateDataImpl;

  List<MemberModel> get data;
  bool get canLoadMore;
  int get page;
  @JsonKey(ignore: true)
  _$$AllFriendsStateDataImplCopyWith<_$AllFriendsStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AllFriendsStateLoadingImplCopyWith<$Res> {
  factory _$$AllFriendsStateLoadingImplCopyWith(
          _$AllFriendsStateLoadingImpl value,
          $Res Function(_$AllFriendsStateLoadingImpl) then) =
      __$$AllFriendsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AllFriendsStateLoadingImplCopyWithImpl<$Res>
    extends _$AllFriendsStateCopyWithImpl<$Res, _$AllFriendsStateLoadingImpl>
    implements _$$AllFriendsStateLoadingImplCopyWith<$Res> {
  __$$AllFriendsStateLoadingImplCopyWithImpl(
      _$AllFriendsStateLoadingImpl _value,
      $Res Function(_$AllFriendsStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AllFriendsStateLoadingImpl implements AllFriendsStateLoading {
  const _$AllFriendsStateLoadingImpl();

  @override
  String toString() {
    return 'AllFriendsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllFriendsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)?
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
    TResult Function(AllFriendsStateData value) $default, {
    required TResult Function(AllFriendsStateLoading value) loading,
    required TResult Function(AllFriendsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AllFriendsStateData value)? $default, {
    TResult? Function(AllFriendsStateLoading value)? loading,
    TResult? Function(AllFriendsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AllFriendsStateData value)? $default, {
    TResult Function(AllFriendsStateLoading value)? loading,
    TResult Function(AllFriendsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AllFriendsStateLoading implements AllFriendsState {
  const factory AllFriendsStateLoading() = _$AllFriendsStateLoadingImpl;
}

/// @nodoc
abstract class _$$AllFriendsStateErrorImplCopyWith<$Res> {
  factory _$$AllFriendsStateErrorImplCopyWith(_$AllFriendsStateErrorImpl value,
          $Res Function(_$AllFriendsStateErrorImpl) then) =
      __$$AllFriendsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$AllFriendsStateErrorImplCopyWithImpl<$Res>
    extends _$AllFriendsStateCopyWithImpl<$Res, _$AllFriendsStateErrorImpl>
    implements _$$AllFriendsStateErrorImplCopyWith<$Res> {
  __$$AllFriendsStateErrorImplCopyWithImpl(_$AllFriendsStateErrorImpl _value,
      $Res Function(_$AllFriendsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AllFriendsStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AllFriendsStateErrorImpl implements AllFriendsStateError {
  const _$AllFriendsStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AllFriendsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllFriendsStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllFriendsStateErrorImplCopyWith<_$AllFriendsStateErrorImpl>
      get copyWith =>
          __$$AllFriendsStateErrorImplCopyWithImpl<_$AllFriendsStateErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> data, bool canLoadMore, int page)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> data, bool canLoadMore, int page)?
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
    TResult Function(AllFriendsStateData value) $default, {
    required TResult Function(AllFriendsStateLoading value) loading,
    required TResult Function(AllFriendsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AllFriendsStateData value)? $default, {
    TResult? Function(AllFriendsStateLoading value)? loading,
    TResult? Function(AllFriendsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AllFriendsStateData value)? $default, {
    TResult Function(AllFriendsStateLoading value)? loading,
    TResult Function(AllFriendsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AllFriendsStateError implements AllFriendsState {
  const factory AllFriendsStateError(final dynamic error) =
      _$AllFriendsStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$AllFriendsStateErrorImplCopyWith<_$AllFriendsStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
