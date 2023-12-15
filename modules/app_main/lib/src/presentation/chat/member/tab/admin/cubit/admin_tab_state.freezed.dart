// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminTabState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MemberListModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MemberListModel data)? $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MemberListModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AdminTabStateData value) $default, {
    required TResult Function(AdminTabStateLoading value) loading,
    required TResult Function(AdminTabStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AdminTabStateData value)? $default, {
    TResult? Function(AdminTabStateLoading value)? loading,
    TResult? Function(AdminTabStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AdminTabStateData value)? $default, {
    TResult Function(AdminTabStateLoading value)? loading,
    TResult Function(AdminTabStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminTabStateCopyWith<$Res> {
  factory $AdminTabStateCopyWith(
          AdminTabState value, $Res Function(AdminTabState) then) =
      _$AdminTabStateCopyWithImpl<$Res, AdminTabState>;
}

/// @nodoc
class _$AdminTabStateCopyWithImpl<$Res, $Val extends AdminTabState>
    implements $AdminTabStateCopyWith<$Res> {
  _$AdminTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AdminTabStateDataImplCopyWith<$Res> {
  factory _$$AdminTabStateDataImplCopyWith(_$AdminTabStateDataImpl value,
          $Res Function(_$AdminTabStateDataImpl) then) =
      __$$AdminTabStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MemberListModel data});
}

/// @nodoc
class __$$AdminTabStateDataImplCopyWithImpl<$Res>
    extends _$AdminTabStateCopyWithImpl<$Res, _$AdminTabStateDataImpl>
    implements _$$AdminTabStateDataImplCopyWith<$Res> {
  __$$AdminTabStateDataImplCopyWithImpl(_$AdminTabStateDataImpl _value,
      $Res Function(_$AdminTabStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AdminTabStateDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberListModel,
    ));
  }
}

/// @nodoc

class _$AdminTabStateDataImpl implements AdminTabStateData {
  const _$AdminTabStateDataImpl({required this.data});

  @override
  final MemberListModel data;

  @override
  String toString() {
    return 'AdminTabState(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTabStateDataImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminTabStateDataImplCopyWith<_$AdminTabStateDataImpl> get copyWith =>
      __$$AdminTabStateDataImplCopyWithImpl<_$AdminTabStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MemberListModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MemberListModel data)? $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MemberListModel data)? $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(AdminTabStateData value) $default, {
    required TResult Function(AdminTabStateLoading value) loading,
    required TResult Function(AdminTabStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AdminTabStateData value)? $default, {
    TResult? Function(AdminTabStateLoading value)? loading,
    TResult? Function(AdminTabStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AdminTabStateData value)? $default, {
    TResult Function(AdminTabStateLoading value)? loading,
    TResult Function(AdminTabStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class AdminTabStateData implements AdminTabState {
  const factory AdminTabStateData({required final MemberListModel data}) =
      _$AdminTabStateDataImpl;

  MemberListModel get data;
  @JsonKey(ignore: true)
  _$$AdminTabStateDataImplCopyWith<_$AdminTabStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdminTabStateLoadingImplCopyWith<$Res> {
  factory _$$AdminTabStateLoadingImplCopyWith(_$AdminTabStateLoadingImpl value,
          $Res Function(_$AdminTabStateLoadingImpl) then) =
      __$$AdminTabStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdminTabStateLoadingImplCopyWithImpl<$Res>
    extends _$AdminTabStateCopyWithImpl<$Res, _$AdminTabStateLoadingImpl>
    implements _$$AdminTabStateLoadingImplCopyWith<$Res> {
  __$$AdminTabStateLoadingImplCopyWithImpl(_$AdminTabStateLoadingImpl _value,
      $Res Function(_$AdminTabStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AdminTabStateLoadingImpl implements AdminTabStateLoading {
  const _$AdminTabStateLoadingImpl();

  @override
  String toString() {
    return 'AdminTabState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTabStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MemberListModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MemberListModel data)? $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MemberListModel data)? $default, {
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
    TResult Function(AdminTabStateData value) $default, {
    required TResult Function(AdminTabStateLoading value) loading,
    required TResult Function(AdminTabStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AdminTabStateData value)? $default, {
    TResult? Function(AdminTabStateLoading value)? loading,
    TResult? Function(AdminTabStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AdminTabStateData value)? $default, {
    TResult Function(AdminTabStateLoading value)? loading,
    TResult Function(AdminTabStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AdminTabStateLoading implements AdminTabState {
  const factory AdminTabStateLoading() = _$AdminTabStateLoadingImpl;
}

/// @nodoc
abstract class _$$AdminTabStateErrorImplCopyWith<$Res> {
  factory _$$AdminTabStateErrorImplCopyWith(_$AdminTabStateErrorImpl value,
          $Res Function(_$AdminTabStateErrorImpl) then) =
      __$$AdminTabStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$AdminTabStateErrorImplCopyWithImpl<$Res>
    extends _$AdminTabStateCopyWithImpl<$Res, _$AdminTabStateErrorImpl>
    implements _$$AdminTabStateErrorImplCopyWith<$Res> {
  __$$AdminTabStateErrorImplCopyWithImpl(_$AdminTabStateErrorImpl _value,
      $Res Function(_$AdminTabStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$AdminTabStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AdminTabStateErrorImpl implements AdminTabStateError {
  const _$AdminTabStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'AdminTabState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTabStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminTabStateErrorImplCopyWith<_$AdminTabStateErrorImpl> get copyWith =>
      __$$AdminTabStateErrorImplCopyWithImpl<_$AdminTabStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(MemberListModel data) $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(MemberListModel data)? $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(MemberListModel data)? $default, {
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
    TResult Function(AdminTabStateData value) $default, {
    required TResult Function(AdminTabStateLoading value) loading,
    required TResult Function(AdminTabStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(AdminTabStateData value)? $default, {
    TResult? Function(AdminTabStateLoading value)? loading,
    TResult? Function(AdminTabStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(AdminTabStateData value)? $default, {
    TResult Function(AdminTabStateLoading value)? loading,
    TResult Function(AdminTabStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AdminTabStateError implements AdminTabState {
  const factory AdminTabStateError(final dynamic error) =
      _$AdminTabStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$AdminTabStateErrorImplCopyWith<_$AdminTabStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
