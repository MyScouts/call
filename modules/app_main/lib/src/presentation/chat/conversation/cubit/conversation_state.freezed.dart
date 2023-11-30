// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConversationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ConversationStateData value) $default, {
    required TResult Function(ConversationStateLoading value) loading,
    required TResult Function(ConversationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ConversationStateData value)? $default, {
    TResult? Function(ConversationStateLoading value)? loading,
    TResult? Function(ConversationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ConversationStateData value)? $default, {
    TResult Function(ConversationStateLoading value)? loading,
    TResult Function(ConversationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationStateCopyWith<$Res> {
  factory $ConversationStateCopyWith(
          ConversationState value, $Res Function(ConversationState) then) =
      _$ConversationStateCopyWithImpl<$Res, ConversationState>;
}

/// @nodoc
class _$ConversationStateCopyWithImpl<$Res, $Val extends ConversationState>
    implements $ConversationStateCopyWith<$Res> {
  _$ConversationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConversationStateDataImplCopyWith<$Res> {
  factory _$$ConversationStateDataImplCopyWith(
          _$ConversationStateDataImpl value,
          $Res Function(_$ConversationStateDataImpl) then) =
      __$$ConversationStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ConversationModel> conversations,
      List<MemberModel> friends,
      int pageFriend,
      int pageConversation,
      bool canLoadMoreFriend,
      bool canLoadMoreConversation});
}

/// @nodoc
class __$$ConversationStateDataImplCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$ConversationStateDataImpl>
    implements _$$ConversationStateDataImplCopyWith<$Res> {
  __$$ConversationStateDataImplCopyWithImpl(_$ConversationStateDataImpl _value,
      $Res Function(_$ConversationStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? friends = null,
    Object? pageFriend = null,
    Object? pageConversation = null,
    Object? canLoadMoreFriend = null,
    Object? canLoadMoreConversation = null,
  }) {
    return _then(_$ConversationStateDataImpl(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationModel>,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>,
      pageFriend: null == pageFriend
          ? _value.pageFriend
          : pageFriend // ignore: cast_nullable_to_non_nullable
              as int,
      pageConversation: null == pageConversation
          ? _value.pageConversation
          : pageConversation // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMoreFriend: null == canLoadMoreFriend
          ? _value.canLoadMoreFriend
          : canLoadMoreFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMoreConversation: null == canLoadMoreConversation
          ? _value.canLoadMoreConversation
          : canLoadMoreConversation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConversationStateDataImpl implements ConversationStateData {
  const _$ConversationStateDataImpl(
      {required final List<ConversationModel> conversations,
      required final List<MemberModel> friends,
      required this.pageFriend,
      required this.pageConversation,
      required this.canLoadMoreFriend,
      required this.canLoadMoreConversation})
      : _conversations = conversations,
        _friends = friends;

  final List<ConversationModel> _conversations;
  @override
  List<ConversationModel> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  final List<MemberModel> _friends;
  @override
  List<MemberModel> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  final int pageFriend;
  @override
  final int pageConversation;
  @override
  final bool canLoadMoreFriend;
  @override
  final bool canLoadMoreConversation;

  @override
  String toString() {
    return 'ConversationState(conversations: $conversations, friends: $friends, pageFriend: $pageFriend, pageConversation: $pageConversation, canLoadMoreFriend: $canLoadMoreFriend, canLoadMoreConversation: $canLoadMoreConversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.pageFriend, pageFriend) ||
                other.pageFriend == pageFriend) &&
            (identical(other.pageConversation, pageConversation) ||
                other.pageConversation == pageConversation) &&
            (identical(other.canLoadMoreFriend, canLoadMoreFriend) ||
                other.canLoadMoreFriend == canLoadMoreFriend) &&
            (identical(
                    other.canLoadMoreConversation, canLoadMoreConversation) ||
                other.canLoadMoreConversation == canLoadMoreConversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_conversations),
      const DeepCollectionEquality().hash(_friends),
      pageFriend,
      pageConversation,
      canLoadMoreFriend,
      canLoadMoreConversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationStateDataImplCopyWith<_$ConversationStateDataImpl>
      get copyWith => __$$ConversationStateDataImplCopyWithImpl<
          _$ConversationStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(conversations, friends, pageFriend, pageConversation,
        canLoadMoreFriend, canLoadMoreConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(conversations, friends, pageFriend, pageConversation,
        canLoadMoreFriend, canLoadMoreConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(conversations, friends, pageFriend, pageConversation,
          canLoadMoreFriend, canLoadMoreConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ConversationStateData value) $default, {
    required TResult Function(ConversationStateLoading value) loading,
    required TResult Function(ConversationStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ConversationStateData value)? $default, {
    TResult? Function(ConversationStateLoading value)? loading,
    TResult? Function(ConversationStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ConversationStateData value)? $default, {
    TResult Function(ConversationStateLoading value)? loading,
    TResult Function(ConversationStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ConversationStateData implements ConversationState {
  const factory ConversationStateData(
          {required final List<ConversationModel> conversations,
          required final List<MemberModel> friends,
          required final int pageFriend,
          required final int pageConversation,
          required final bool canLoadMoreFriend,
          required final bool canLoadMoreConversation}) =
      _$ConversationStateDataImpl;

  List<ConversationModel> get conversations;
  List<MemberModel> get friends;
  int get pageFriend;
  int get pageConversation;
  bool get canLoadMoreFriend;
  bool get canLoadMoreConversation;
  @JsonKey(ignore: true)
  _$$ConversationStateDataImplCopyWith<_$ConversationStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConversationStateLoadingImplCopyWith<$Res> {
  factory _$$ConversationStateLoadingImplCopyWith(
          _$ConversationStateLoadingImpl value,
          $Res Function(_$ConversationStateLoadingImpl) then) =
      __$$ConversationStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConversationStateLoadingImplCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res,
        _$ConversationStateLoadingImpl>
    implements _$$ConversationStateLoadingImplCopyWith<$Res> {
  __$$ConversationStateLoadingImplCopyWithImpl(
      _$ConversationStateLoadingImpl _value,
      $Res Function(_$ConversationStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ConversationStateLoadingImpl implements ConversationStateLoading {
  const _$ConversationStateLoadingImpl();

  @override
  String toString() {
    return 'ConversationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
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
    TResult Function(ConversationStateData value) $default, {
    required TResult Function(ConversationStateLoading value) loading,
    required TResult Function(ConversationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ConversationStateData value)? $default, {
    TResult? Function(ConversationStateLoading value)? loading,
    TResult? Function(ConversationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ConversationStateData value)? $default, {
    TResult Function(ConversationStateLoading value)? loading,
    TResult Function(ConversationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConversationStateLoading implements ConversationState {
  const factory ConversationStateLoading() = _$ConversationStateLoadingImpl;
}

/// @nodoc
abstract class _$$ConversationStateErrorImplCopyWith<$Res> {
  factory _$$ConversationStateErrorImplCopyWith(
          _$ConversationStateErrorImpl value,
          $Res Function(_$ConversationStateErrorImpl) then) =
      __$$ConversationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$ConversationStateErrorImplCopyWithImpl<$Res>
    extends _$ConversationStateCopyWithImpl<$Res, _$ConversationStateErrorImpl>
    implements _$$ConversationStateErrorImplCopyWith<$Res> {
  __$$ConversationStateErrorImplCopyWithImpl(
      _$ConversationStateErrorImpl _value,
      $Res Function(_$ConversationStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ConversationStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ConversationStateErrorImpl implements ConversationStateError {
  const _$ConversationStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'ConversationState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationStateErrorImplCopyWith<_$ConversationStateErrorImpl>
      get copyWith => __$$ConversationStateErrorImplCopyWithImpl<
          _$ConversationStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<ConversationModel> conversations,
            List<MemberModel> friends,
            int pageFriend,
            int pageConversation,
            bool canLoadMoreFriend,
            bool canLoadMoreConversation)?
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
    TResult Function(ConversationStateData value) $default, {
    required TResult Function(ConversationStateLoading value) loading,
    required TResult Function(ConversationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ConversationStateData value)? $default, {
    TResult? Function(ConversationStateLoading value)? loading,
    TResult? Function(ConversationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ConversationStateData value)? $default, {
    TResult Function(ConversationStateLoading value)? loading,
    TResult Function(ConversationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConversationStateError implements ConversationState {
  const factory ConversationStateError(final dynamic error) =
      _$ConversationStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$ConversationStateErrorImplCopyWith<_$ConversationStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
