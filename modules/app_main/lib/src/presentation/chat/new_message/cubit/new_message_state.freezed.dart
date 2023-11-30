// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewMessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewMessageStateData value) $default, {
    required TResult Function(NewMessageStateLoading value) loading,
    required TResult Function(NewMessageStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NewMessageStateData value)? $default, {
    TResult? Function(NewMessageStateLoading value)? loading,
    TResult? Function(NewMessageStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewMessageStateData value)? $default, {
    TResult Function(NewMessageStateLoading value)? loading,
    TResult Function(NewMessageStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMessageStateCopyWith<$Res> {
  factory $NewMessageStateCopyWith(
          NewMessageState value, $Res Function(NewMessageState) then) =
      _$NewMessageStateCopyWithImpl<$Res, NewMessageState>;
}

/// @nodoc
class _$NewMessageStateCopyWithImpl<$Res, $Val extends NewMessageState>
    implements $NewMessageStateCopyWith<$Res> {
  _$NewMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewMessageStateDataImplCopyWith<$Res> {
  factory _$$NewMessageStateDataImplCopyWith(_$NewMessageStateDataImpl value,
          $Res Function(_$NewMessageStateDataImpl) then) =
      __$$NewMessageStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MemberModel> friends,
      int page,
      bool canLoadMore,
      String keySearch});
}

/// @nodoc
class __$$NewMessageStateDataImplCopyWithImpl<$Res>
    extends _$NewMessageStateCopyWithImpl<$Res, _$NewMessageStateDataImpl>
    implements _$$NewMessageStateDataImplCopyWith<$Res> {
  __$$NewMessageStateDataImplCopyWithImpl(_$NewMessageStateDataImpl _value,
      $Res Function(_$NewMessageStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? keySearch = null,
  }) {
    return _then(_$NewMessageStateDataImpl(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      keySearch: null == keySearch
          ? _value.keySearch
          : keySearch // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewMessageStateDataImpl implements NewMessageStateData {
  const _$NewMessageStateDataImpl(
      {required final List<MemberModel> friends,
      required this.page,
      required this.canLoadMore,
      required this.keySearch})
      : _friends = friends;

  final List<MemberModel> _friends;
  @override
  List<MemberModel> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  final int page;
  @override
  final bool canLoadMore;
  @override
  final String keySearch;

  @override
  String toString() {
    return 'NewMessageState(friends: $friends, page: $page, canLoadMore: $canLoadMore, keySearch: $keySearch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMessageStateDataImpl &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.keySearch, keySearch) ||
                other.keySearch == keySearch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friends),
      page,
      canLoadMore,
      keySearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewMessageStateDataImplCopyWith<_$NewMessageStateDataImpl> get copyWith =>
      __$$NewMessageStateDataImplCopyWithImpl<_$NewMessageStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(friends, page, canLoadMore, keySearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(friends, page, canLoadMore, keySearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(friends, page, canLoadMore, keySearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(NewMessageStateData value) $default, {
    required TResult Function(NewMessageStateLoading value) loading,
    required TResult Function(NewMessageStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NewMessageStateData value)? $default, {
    TResult? Function(NewMessageStateLoading value)? loading,
    TResult? Function(NewMessageStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewMessageStateData value)? $default, {
    TResult Function(NewMessageStateLoading value)? loading,
    TResult Function(NewMessageStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class NewMessageStateData implements NewMessageState {
  const factory NewMessageStateData(
      {required final List<MemberModel> friends,
      required final int page,
      required final bool canLoadMore,
      required final String keySearch}) = _$NewMessageStateDataImpl;

  List<MemberModel> get friends;
  int get page;
  bool get canLoadMore;
  String get keySearch;
  @JsonKey(ignore: true)
  _$$NewMessageStateDataImplCopyWith<_$NewMessageStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewMessageStateLoadingImplCopyWith<$Res> {
  factory _$$NewMessageStateLoadingImplCopyWith(
          _$NewMessageStateLoadingImpl value,
          $Res Function(_$NewMessageStateLoadingImpl) then) =
      __$$NewMessageStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewMessageStateLoadingImplCopyWithImpl<$Res>
    extends _$NewMessageStateCopyWithImpl<$Res, _$NewMessageStateLoadingImpl>
    implements _$$NewMessageStateLoadingImplCopyWith<$Res> {
  __$$NewMessageStateLoadingImplCopyWithImpl(
      _$NewMessageStateLoadingImpl _value,
      $Res Function(_$NewMessageStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewMessageStateLoadingImpl implements NewMessageStateLoading {
  const _$NewMessageStateLoadingImpl();

  @override
  String toString() {
    return 'NewMessageState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMessageStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
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
    TResult Function(NewMessageStateData value) $default, {
    required TResult Function(NewMessageStateLoading value) loading,
    required TResult Function(NewMessageStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NewMessageStateData value)? $default, {
    TResult? Function(NewMessageStateLoading value)? loading,
    TResult? Function(NewMessageStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewMessageStateData value)? $default, {
    TResult Function(NewMessageStateLoading value)? loading,
    TResult Function(NewMessageStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class NewMessageStateLoading implements NewMessageState {
  const factory NewMessageStateLoading() = _$NewMessageStateLoadingImpl;
}

/// @nodoc
abstract class _$$NewMessageStateErrorImplCopyWith<$Res> {
  factory _$$NewMessageStateErrorImplCopyWith(_$NewMessageStateErrorImpl value,
          $Res Function(_$NewMessageStateErrorImpl) then) =
      __$$NewMessageStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$NewMessageStateErrorImplCopyWithImpl<$Res>
    extends _$NewMessageStateCopyWithImpl<$Res, _$NewMessageStateErrorImpl>
    implements _$$NewMessageStateErrorImplCopyWith<$Res> {
  __$$NewMessageStateErrorImplCopyWithImpl(_$NewMessageStateErrorImpl _value,
      $Res Function(_$NewMessageStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$NewMessageStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$NewMessageStateErrorImpl implements NewMessageStateError {
  const _$NewMessageStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'NewMessageState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMessageStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewMessageStateErrorImplCopyWith<_$NewMessageStateErrorImpl>
      get copyWith =>
          __$$NewMessageStateErrorImplCopyWithImpl<_$NewMessageStateErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, int page, bool canLoadMore,
            String keySearch)?
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
    TResult Function(NewMessageStateData value) $default, {
    required TResult Function(NewMessageStateLoading value) loading,
    required TResult Function(NewMessageStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(NewMessageStateData value)? $default, {
    TResult? Function(NewMessageStateLoading value)? loading,
    TResult? Function(NewMessageStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(NewMessageStateData value)? $default, {
    TResult Function(NewMessageStateLoading value)? loading,
    TResult Function(NewMessageStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NewMessageStateError implements NewMessageState {
  const factory NewMessageStateError(final dynamic error) =
      _$NewMessageStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$NewMessageStateErrorImplCopyWith<_$NewMessageStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
