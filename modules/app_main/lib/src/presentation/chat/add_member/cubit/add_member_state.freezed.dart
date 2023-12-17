// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddMemberState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AddMemberStateData value) $default, {
    required TResult Function(AddMemberStateLoading value) loading,
    required TResult Function(AddMemberStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AddMemberStateData value)? $default, {
    TResult? Function(AddMemberStateLoading value)? loading,
    TResult? Function(AddMemberStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AddMemberStateData value)? $default, {
    TResult Function(AddMemberStateLoading value)? loading,
    TResult Function(AddMemberStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMemberStateCopyWith<$Res> {
  factory $AddMemberStateCopyWith(
          AddMemberState value, $Res Function(AddMemberState) then) =
      _$AddMemberStateCopyWithImpl<$Res, AddMemberState>;
}

/// @nodoc
class _$AddMemberStateCopyWithImpl<$Res, $Val extends AddMemberState>
    implements $AddMemberStateCopyWith<$Res> {
  _$AddMemberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddMemberStateDataImplCopyWith<$Res> {
  factory _$$AddMemberStateDataImplCopyWith(_$AddMemberStateDataImpl value,
          $Res Function(_$AddMemberStateDataImpl) then) =
      __$$AddMemberStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MemberModel> friends,
      List<MemberModel> listChoice,
      int page,
      bool canLoadMore,
      String keySearch});
}

/// @nodoc
class __$$AddMemberStateDataImplCopyWithImpl<$Res>
    extends _$AddMemberStateCopyWithImpl<$Res, _$AddMemberStateDataImpl>
    implements _$$AddMemberStateDataImplCopyWith<$Res> {
  __$$AddMemberStateDataImplCopyWithImpl(_$AddMemberStateDataImpl _value,
      $Res Function(_$AddMemberStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friends = null,
    Object? listChoice = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? keySearch = null,
  }) {
    return _then(_$AddMemberStateDataImpl(
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
    ));
  }
}

/// @nodoc

class _$AddMemberStateDataImpl implements AddMemberStateData {
  const _$AddMemberStateDataImpl(
      {required final List<MemberModel> friends,
      required final List<MemberModel> listChoice,
      required this.page,
      required this.canLoadMore,
      required this.keySearch})
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
  String toString() {
    return 'AddMemberState(friends: $friends, listChoice: $listChoice, page: $page, canLoadMore: $canLoadMore, keySearch: $keySearch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMemberStateDataImpl &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._listChoice, _listChoice) &&
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
      const DeepCollectionEquality().hash(_listChoice),
      page,
      canLoadMore,
      keySearch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMemberStateDataImplCopyWith<_$AddMemberStateDataImpl> get copyWith =>
      __$$AddMemberStateDataImplCopyWithImpl<_$AddMemberStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(friends, listChoice, page, canLoadMore, keySearch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(friends, listChoice, page, canLoadMore, keySearch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(friends, listChoice, page, canLoadMore, keySearch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AddMemberStateData value) $default, {
    required TResult Function(AddMemberStateLoading value) loading,
    required TResult Function(AddMemberStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AddMemberStateData value)? $default, {
    TResult? Function(AddMemberStateLoading value)? loading,
    TResult? Function(AddMemberStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AddMemberStateData value)? $default, {
    TResult Function(AddMemberStateLoading value)? loading,
    TResult Function(AddMemberStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AddMemberStateData implements AddMemberState {
  const factory AddMemberStateData(
      {required final List<MemberModel> friends,
      required final List<MemberModel> listChoice,
      required final int page,
      required final bool canLoadMore,
      required final String keySearch}) = _$AddMemberStateDataImpl;

  List<MemberModel> get friends;
  List<MemberModel> get listChoice;
  int get page;
  bool get canLoadMore;
  String get keySearch;
  @JsonKey(ignore: true)
  _$$AddMemberStateDataImplCopyWith<_$AddMemberStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddMemberStateLoadingImplCopyWith<$Res> {
  factory _$$AddMemberStateLoadingImplCopyWith(
          _$AddMemberStateLoadingImpl value,
          $Res Function(_$AddMemberStateLoadingImpl) then) =
      __$$AddMemberStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddMemberStateLoadingImplCopyWithImpl<$Res>
    extends _$AddMemberStateCopyWithImpl<$Res, _$AddMemberStateLoadingImpl>
    implements _$$AddMemberStateLoadingImplCopyWith<$Res> {
  __$$AddMemberStateLoadingImplCopyWithImpl(_$AddMemberStateLoadingImpl _value,
      $Res Function(_$AddMemberStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddMemberStateLoadingImpl implements AddMemberStateLoading {
  const _$AddMemberStateLoadingImpl();

  @override
  String toString() {
    return 'AddMemberState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMemberStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)
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
            int page, bool canLoadMore, String keySearch)?
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
            int page, bool canLoadMore, String keySearch)?
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
    TResult Function(AddMemberStateData value) $default, {
    required TResult Function(AddMemberStateLoading value) loading,
    required TResult Function(AddMemberStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AddMemberStateData value)? $default, {
    TResult? Function(AddMemberStateLoading value)? loading,
    TResult? Function(AddMemberStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AddMemberStateData value)? $default, {
    TResult Function(AddMemberStateLoading value)? loading,
    TResult Function(AddMemberStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddMemberStateLoading implements AddMemberState {
  const factory AddMemberStateLoading() = _$AddMemberStateLoadingImpl;
}

/// @nodoc
abstract class _$$AddMemberStateErrorImplCopyWith<$Res> {
  factory _$$AddMemberStateErrorImplCopyWith(_$AddMemberStateErrorImpl value,
          $Res Function(_$AddMemberStateErrorImpl) then) =
      __$$AddMemberStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$AddMemberStateErrorImplCopyWithImpl<$Res>
    extends _$AddMemberStateCopyWithImpl<$Res, _$AddMemberStateErrorImpl>
    implements _$$AddMemberStateErrorImplCopyWith<$Res> {
  __$$AddMemberStateErrorImplCopyWithImpl(_$AddMemberStateErrorImpl _value,
      $Res Function(_$AddMemberStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AddMemberStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AddMemberStateErrorImpl implements AddMemberStateError {
  const _$AddMemberStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AddMemberState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMemberStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMemberStateErrorImplCopyWith<_$AddMemberStateErrorImpl> get copyWith =>
      __$$AddMemberStateErrorImplCopyWithImpl<_$AddMemberStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MemberModel> friends, List<MemberModel> listChoice,
            int page, bool canLoadMore, String keySearch)
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
            int page, bool canLoadMore, String keySearch)?
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
            int page, bool canLoadMore, String keySearch)?
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
    TResult Function(AddMemberStateData value) $default, {
    required TResult Function(AddMemberStateLoading value) loading,
    required TResult Function(AddMemberStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AddMemberStateData value)? $default, {
    TResult? Function(AddMemberStateLoading value)? loading,
    TResult? Function(AddMemberStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AddMemberStateData value)? $default, {
    TResult Function(AddMemberStateLoading value)? loading,
    TResult Function(AddMemberStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddMemberStateError implements AddMemberState {
  const factory AddMemberStateError(final dynamic error) =
      _$AddMemberStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$AddMemberStateErrorImplCopyWith<_$AddMemberStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
