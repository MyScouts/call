// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CreateRoomStateData value) $default, {
    required TResult Function(CreateRoomStateLoading value) loading,
    required TResult Function(CreateRoomStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CreateRoomStateData value)? $default, {
    TResult? Function(CreateRoomStateLoading value)? loading,
    TResult? Function(CreateRoomStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CreateRoomStateData value)? $default, {
    TResult Function(CreateRoomStateLoading value)? loading,
    TResult Function(CreateRoomStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoomStateCopyWith<$Res> {
  factory $CreateRoomStateCopyWith(
          CreateRoomState value, $Res Function(CreateRoomState) then) =
      _$CreateRoomStateCopyWithImpl<$Res, CreateRoomState>;
}

/// @nodoc
class _$CreateRoomStateCopyWithImpl<$Res, $Val extends CreateRoomState>
    implements $CreateRoomStateCopyWith<$Res> {
  _$CreateRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateRoomStateDataImplCopyWith<$Res> {
  factory _$$CreateRoomStateDataImplCopyWith(_$CreateRoomStateDataImpl value,
          $Res Function(_$CreateRoomStateDataImpl) then) =
      __$$CreateRoomStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MemberModel> friends,
      List<MemberModel> listChoice,
      int page,
      bool canLoadMore,
      String keySearch,
      int step});
}

/// @nodoc
class __$$CreateRoomStateDataImplCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res, _$CreateRoomStateDataImpl>
    implements _$$CreateRoomStateDataImplCopyWith<$Res> {
  __$$CreateRoomStateDataImplCopyWithImpl(_$CreateRoomStateDataImpl _value,
      $Res Function(_$CreateRoomStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? listChoice = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? keySearch = null,
    Object? step = null,
  }) {
    return _then(_$CreateRoomStateDataImpl(
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      listChoice: null == listChoice
          ? _value._listChoice
          : listChoice // ignore: cast_nullable_to_non_nullable
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
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CreateRoomStateDataImpl implements CreateRoomStateData {
  const _$CreateRoomStateDataImpl(
      {required final List<MemberModel> friends,
      required final List<MemberModel> listChoice,
      required this.page,
      required this.canLoadMore,
      required this.keySearch,
      required this.step})
      : _friends = friends,
        _listChoice = listChoice;

  final List<MemberModel> _friends;
  @override
  List<MemberModel> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<MemberModel> _listChoice;
  @override
  List<MemberModel> get listChoice {
    if (_listChoice is EqualUnmodifiableListView) return _listChoice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listChoice);
  }

  @override
  final int page;
  @override
  final bool canLoadMore;
  @override
  final String keySearch;
  @override
  final int step;

  @override
  String toString() {
    return 'CreateRoomState(friends: $friends, listChoice: $listChoice, page: $page, canLoadMore: $canLoadMore, keySearch: $keySearch, step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomStateDataImpl &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._listChoice, _listChoice) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.keySearch, keySearch) ||
                other.keySearch == keySearch) &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_listChoice),
      page,
      canLoadMore,
      keySearch,
      step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoomStateDataImplCopyWith<_$CreateRoomStateDataImpl> get copyWith =>
      __$$CreateRoomStateDataImplCopyWithImpl<_$CreateRoomStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(friends, listChoice, page, canLoadMore, keySearch, step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(
        friends, listChoice, page, canLoadMore, keySearch, step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(friends, listChoice, page, canLoadMore, keySearch, step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(CreateRoomStateData value) $default, {
    required TResult Function(CreateRoomStateLoading value) loading,
    required TResult Function(CreateRoomStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CreateRoomStateData value)? $default, {
    TResult? Function(CreateRoomStateLoading value)? loading,
    TResult? Function(CreateRoomStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CreateRoomStateData value)? $default, {
    TResult Function(CreateRoomStateLoading value)? loading,
    TResult Function(CreateRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class CreateRoomStateData implements CreateRoomState {
  const factory CreateRoomStateData(
      {required final List<MemberModel> friends,
      required final List<MemberModel> listChoice,
      required final int page,
      required final bool canLoadMore,
      required final String keySearch,
      required final int step}) = _$CreateRoomStateDataImpl;

  List<MemberModel> get friends;
  List<MemberModel> get listChoice;
  int get page;
  bool get canLoadMore;
  String get keySearch;
  int get step;
  @JsonKey(ignore: true)
  _$$CreateRoomStateDataImplCopyWith<_$CreateRoomStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRoomStateLoadingImplCopyWith<$Res> {
  factory _$$CreateRoomStateLoadingImplCopyWith(
          _$CreateRoomStateLoadingImpl value,
          $Res Function(_$CreateRoomStateLoadingImpl) then) =
      __$$CreateRoomStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateRoomStateLoadingImplCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res, _$CreateRoomStateLoadingImpl>
    implements _$$CreateRoomStateLoadingImplCopyWith<$Res> {
  __$$CreateRoomStateLoadingImplCopyWithImpl(
      _$CreateRoomStateLoadingImpl _value,
      $Res Function(_$CreateRoomStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateRoomStateLoadingImpl implements CreateRoomStateLoading {
  const _$CreateRoomStateLoadingImpl();

  @override
  String toString() {
    return 'CreateRoomState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
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
    TResult Function(CreateRoomStateData value) $default, {
    required TResult Function(CreateRoomStateLoading value) loading,
    required TResult Function(CreateRoomStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CreateRoomStateData value)? $default, {
    TResult? Function(CreateRoomStateLoading value)? loading,
    TResult? Function(CreateRoomStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CreateRoomStateData value)? $default, {
    TResult Function(CreateRoomStateLoading value)? loading,
    TResult Function(CreateRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CreateRoomStateLoading implements CreateRoomState {
  const factory CreateRoomStateLoading() = _$CreateRoomStateLoadingImpl;
}

/// @nodoc
abstract class _$$CreateRoomStateErrorImplCopyWith<$Res> {
  factory _$$CreateRoomStateErrorImplCopyWith(_$CreateRoomStateErrorImpl value,
          $Res Function(_$CreateRoomStateErrorImpl) then) =
      __$$CreateRoomStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$CreateRoomStateErrorImplCopyWithImpl<$Res>
    extends _$CreateRoomStateCopyWithImpl<$Res, _$CreateRoomStateErrorImpl>
    implements _$$CreateRoomStateErrorImplCopyWith<$Res> {
  __$$CreateRoomStateErrorImplCopyWithImpl(_$CreateRoomStateErrorImpl _value,
      $Res Function(_$CreateRoomStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$CreateRoomStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$CreateRoomStateErrorImpl implements CreateRoomStateError {
  const _$CreateRoomStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'CreateRoomState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoomStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoomStateErrorImplCopyWith<_$CreateRoomStateErrorImpl>
      get copyWith =>
          __$$CreateRoomStateErrorImplCopyWithImpl<_$CreateRoomStateErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch, int step)?
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
    TResult Function(CreateRoomStateData value) $default, {
    required TResult Function(CreateRoomStateLoading value) loading,
    required TResult Function(CreateRoomStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(CreateRoomStateData value)? $default, {
    TResult? Function(CreateRoomStateLoading value)? loading,
    TResult? Function(CreateRoomStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(CreateRoomStateData value)? $default, {
    TResult Function(CreateRoomStateLoading value)? loading,
    TResult Function(CreateRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CreateRoomStateError implements CreateRoomState {
  const factory CreateRoomStateError(final dynamic error) =
      _$CreateRoomStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$CreateRoomStateErrorImplCopyWith<_$CreateRoomStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
