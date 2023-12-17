// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_tab_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemberTabState {
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
    TResult Function(MemberTabStateData value) $default, {
    required TResult Function(MemberTabStateLoading value) loading,
    required TResult Function(MemberTabStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MemberTabStateData value)? $default, {
    TResult? Function(MemberTabStateLoading value)? loading,
    TResult? Function(MemberTabStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MemberTabStateData value)? $default, {
    TResult Function(MemberTabStateLoading value)? loading,
    TResult Function(MemberTabStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberTabStateCopyWith<$Res> {
  factory $MemberTabStateCopyWith(
          MemberTabState value, $Res Function(MemberTabState) then) =
      _$MemberTabStateCopyWithImpl<$Res, MemberTabState>;
}

/// @nodoc
class _$MemberTabStateCopyWithImpl<$Res, $Val extends MemberTabState>
    implements $MemberTabStateCopyWith<$Res> {
  _$MemberTabStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MemberTabStateDataImplCopyWith<$Res> {
  factory _$$MemberTabStateDataImplCopyWith(_$MemberTabStateDataImpl value,
          $Res Function(_$MemberTabStateDataImpl) then) =
      __$$MemberTabStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MemberListModel data});
}

/// @nodoc
class __$$MemberTabStateDataImplCopyWithImpl<$Res>
    extends _$MemberTabStateCopyWithImpl<$Res, _$MemberTabStateDataImpl>
    implements _$$MemberTabStateDataImplCopyWith<$Res> {
  __$$MemberTabStateDataImplCopyWithImpl(_$MemberTabStateDataImpl _value,
      $Res Function(_$MemberTabStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MemberTabStateDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MemberListModel,
    ));
  }
}

/// @nodoc

class _$MemberTabStateDataImpl implements MemberTabStateData {
  const _$MemberTabStateDataImpl({required this.data});

  @override
  final MemberListModel data;

  @override
  String toString() {
    return 'MemberTabState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberTabStateDataImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberTabStateDataImplCopyWith<_$MemberTabStateDataImpl> get copyWith =>
      __$$MemberTabStateDataImplCopyWithImpl<_$MemberTabStateDataImpl>(
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
    TResult Function(MemberTabStateData value) $default, {
    required TResult Function(MemberTabStateLoading value) loading,
    required TResult Function(MemberTabStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MemberTabStateData value)? $default, {
    TResult? Function(MemberTabStateLoading value)? loading,
    TResult? Function(MemberTabStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MemberTabStateData value)? $default, {
    TResult Function(MemberTabStateLoading value)? loading,
    TResult Function(MemberTabStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class MemberTabStateData implements MemberTabState {
  const factory MemberTabStateData({required final MemberListModel data}) =
      _$MemberTabStateDataImpl;

  MemberListModel get data;
  @JsonKey(ignore: true)
  _$$MemberTabStateDataImplCopyWith<_$MemberTabStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MemberTabStateLoadingImplCopyWith<$Res> {
  factory _$$MemberTabStateLoadingImplCopyWith(
          _$MemberTabStateLoadingImpl value,
          $Res Function(_$MemberTabStateLoadingImpl) then) =
      __$$MemberTabStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberTabStateLoadingImplCopyWithImpl<$Res>
    extends _$MemberTabStateCopyWithImpl<$Res, _$MemberTabStateLoadingImpl>
    implements _$$MemberTabStateLoadingImplCopyWith<$Res> {
  __$$MemberTabStateLoadingImplCopyWithImpl(_$MemberTabStateLoadingImpl _value,
      $Res Function(_$MemberTabStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MemberTabStateLoadingImpl implements MemberTabStateLoading {
  const _$MemberTabStateLoadingImpl();

  @override
  String toString() {
    return 'MemberTabState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberTabStateLoadingImpl);
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
    TResult Function(MemberTabStateData value) $default, {
    required TResult Function(MemberTabStateLoading value) loading,
    required TResult Function(MemberTabStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MemberTabStateData value)? $default, {
    TResult? Function(MemberTabStateLoading value)? loading,
    TResult? Function(MemberTabStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MemberTabStateData value)? $default, {
    TResult Function(MemberTabStateLoading value)? loading,
    TResult Function(MemberTabStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemberTabStateLoading implements MemberTabState {
  const factory MemberTabStateLoading() = _$MemberTabStateLoadingImpl;
}

/// @nodoc
abstract class _$$MemberTabStateErrorImplCopyWith<$Res> {
  factory _$$MemberTabStateErrorImplCopyWith(_$MemberTabStateErrorImpl value,
          $Res Function(_$MemberTabStateErrorImpl) then) =
      __$$MemberTabStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$MemberTabStateErrorImplCopyWithImpl<$Res>
    extends _$MemberTabStateCopyWithImpl<$Res, _$MemberTabStateErrorImpl>
    implements _$$MemberTabStateErrorImplCopyWith<$Res> {
  __$$MemberTabStateErrorImplCopyWithImpl(_$MemberTabStateErrorImpl _value,
      $Res Function(_$MemberTabStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$MemberTabStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$MemberTabStateErrorImpl implements MemberTabStateError {
  const _$MemberTabStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'MemberTabState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberTabStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberTabStateErrorImplCopyWith<_$MemberTabStateErrorImpl> get copyWith =>
      __$$MemberTabStateErrorImplCopyWithImpl<_$MemberTabStateErrorImpl>(
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
    TResult Function(MemberTabStateData value) $default, {
    required TResult Function(MemberTabStateLoading value) loading,
    required TResult Function(MemberTabStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(MemberTabStateData value)? $default, {
    TResult? Function(MemberTabStateLoading value)? loading,
    TResult? Function(MemberTabStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(MemberTabStateData value)? $default, {
    TResult Function(MemberTabStateLoading value)? loading,
    TResult Function(MemberTabStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MemberTabStateError implements MemberTabState {
  const factory MemberTabStateError(final dynamic error) =
      _$MemberTabStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$MemberTabStateErrorImplCopyWith<_$MemberTabStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
