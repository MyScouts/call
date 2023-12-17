// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatRoomStateData value) $default, {
    required TResult Function(ChatRoomStateLoading value) loading,
    required TResult Function(ChatRoomStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatRoomStateData value)? $default, {
    TResult? Function(ChatRoomStateLoading value)? loading,
    TResult? Function(ChatRoomStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomStateData value)? $default, {
    TResult Function(ChatRoomStateLoading value)? loading,
    TResult Function(ChatRoomStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
          ChatRoomState value, $Res Function(ChatRoomState) then) =
      _$ChatRoomStateCopyWithImpl<$Res, ChatRoomState>;
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res, $Val extends ChatRoomState>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatRoomStateDataImplCopyWith<$Res> {
  factory _$$ChatRoomStateDataImplCopyWith(_$ChatRoomStateDataImpl value,
          $Res Function(_$ChatRoomStateDataImpl) then) =
      __$$ChatRoomStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MessageModel> messages,
      ConversationDetailResponseModel conversation,
      FriendStatusModel? friendStatus,
      int myType,
      int page,
      bool canLoadMore,
      bool? loadMoreError});
}

/// @nodoc
class __$$ChatRoomStateDataImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$ChatRoomStateDataImpl>
    implements _$$ChatRoomStateDataImplCopyWith<$Res> {
  __$$ChatRoomStateDataImplCopyWithImpl(_$ChatRoomStateDataImpl _value,
      $Res Function(_$ChatRoomStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? conversation = null,
    Object? friendStatus = freezed,
    Object? myType = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? loadMoreError = freezed,
  }) {
    return _then(_$ChatRoomStateDataImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      conversation: null == conversation
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as ConversationDetailResponseModel,
      friendStatus: freezed == friendStatus
          ? _value.friendStatus
          : friendStatus // ignore: cast_nullable_to_non_nullable
              as FriendStatusModel?,
      myType: null == myType
          ? _value.myType
          : myType // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      loadMoreError: freezed == loadMoreError
          ? _value.loadMoreError
          : loadMoreError // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ChatRoomStateDataImpl implements ChatRoomStateData {
  const _$ChatRoomStateDataImpl(
      {required final List<MessageModel> messages,
      required this.conversation,
      this.friendStatus,
      required this.myType,
      required this.page,
      required this.canLoadMore,
      this.loadMoreError})
      : _messages = messages;

  final List<MessageModel> _messages;
  @override
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final ConversationDetailResponseModel conversation;
  @override
  final FriendStatusModel? friendStatus;
  @override
  final int myType;
  @override
  final int page;
  @override
  final bool canLoadMore;
  @override
  final bool? loadMoreError;

  @override
  String toString() {
    return 'ChatRoomState(messages: $messages, conversation: $conversation, friendStatus: $friendStatus, myType: $myType, page: $page, canLoadMore: $canLoadMore, loadMoreError: $loadMoreError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStateDataImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            (identical(other.friendStatus, friendStatus) ||
                other.friendStatus == friendStatus) &&
            (identical(other.myType, myType) || other.myType == myType) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.loadMoreError, loadMoreError) ||
                other.loadMoreError == loadMoreError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      conversation,
      friendStatus,
      myType,
      page,
      canLoadMore,
      loadMoreError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomStateDataImplCopyWith<_$ChatRoomStateDataImpl> get copyWith =>
      __$$ChatRoomStateDataImplCopyWithImpl<_$ChatRoomStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)
        $default, {
    required TResult Function() loading,
    required TResult Function(dynamic error) error,
  }) {
    return $default(messages, conversation, friendStatus, myType, page,
        canLoadMore, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
        $default, {
    TResult? Function()? loading,
    TResult? Function(dynamic error)? error,
  }) {
    return $default?.call(messages, conversation, friendStatus, myType, page,
        canLoadMore, loadMoreError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
        $default, {
    TResult Function()? loading,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(messages, conversation, friendStatus, myType, page,
          canLoadMore, loadMoreError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ChatRoomStateData value) $default, {
    required TResult Function(ChatRoomStateLoading value) loading,
    required TResult Function(ChatRoomStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatRoomStateData value)? $default, {
    TResult? Function(ChatRoomStateLoading value)? loading,
    TResult? Function(ChatRoomStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomStateData value)? $default, {
    TResult Function(ChatRoomStateLoading value)? loading,
    TResult Function(ChatRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ChatRoomStateData implements ChatRoomState {
  const factory ChatRoomStateData(
      {required final List<MessageModel> messages,
      required final ConversationDetailResponseModel conversation,
      final FriendStatusModel? friendStatus,
      required final int myType,
      required final int page,
      required final bool canLoadMore,
      final bool? loadMoreError}) = _$ChatRoomStateDataImpl;

  List<MessageModel> get messages;
  ConversationDetailResponseModel get conversation;
  FriendStatusModel? get friendStatus;
  int get myType;
  int get page;
  bool get canLoadMore;
  bool? get loadMoreError;
  @JsonKey(ignore: true)
  _$$ChatRoomStateDataImplCopyWith<_$ChatRoomStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomStateLoadingImplCopyWith<$Res> {
  factory _$$ChatRoomStateLoadingImplCopyWith(_$ChatRoomStateLoadingImpl value,
          $Res Function(_$ChatRoomStateLoadingImpl) then) =
      __$$ChatRoomStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatRoomStateLoadingImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$ChatRoomStateLoadingImpl>
    implements _$$ChatRoomStateLoadingImplCopyWith<$Res> {
  __$$ChatRoomStateLoadingImplCopyWithImpl(_$ChatRoomStateLoadingImpl _value,
      $Res Function(_$ChatRoomStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChatRoomStateLoadingImpl implements ChatRoomStateLoading {
  const _$ChatRoomStateLoadingImpl();

  @override
  String toString() {
    return 'ChatRoomState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)
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
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
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
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
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
    TResult Function(ChatRoomStateData value) $default, {
    required TResult Function(ChatRoomStateLoading value) loading,
    required TResult Function(ChatRoomStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatRoomStateData value)? $default, {
    TResult? Function(ChatRoomStateLoading value)? loading,
    TResult? Function(ChatRoomStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomStateData value)? $default, {
    TResult Function(ChatRoomStateLoading value)? loading,
    TResult Function(ChatRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatRoomStateLoading implements ChatRoomState {
  const factory ChatRoomStateLoading() = _$ChatRoomStateLoadingImpl;
}

/// @nodoc
abstract class _$$ChatRoomStateErrorImplCopyWith<$Res> {
  factory _$$ChatRoomStateErrorImplCopyWith(_$ChatRoomStateErrorImpl value,
          $Res Function(_$ChatRoomStateErrorImpl) then) =
      __$$ChatRoomStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$ChatRoomStateErrorImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$ChatRoomStateErrorImpl>
    implements _$$ChatRoomStateErrorImplCopyWith<$Res> {
  __$$ChatRoomStateErrorImplCopyWithImpl(_$ChatRoomStateErrorImpl _value,
      $Res Function(_$ChatRoomStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$ChatRoomStateErrorImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ChatRoomStateErrorImpl implements ChatRoomStateError {
  const _$ChatRoomStateErrorImpl(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'ChatRoomState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStateErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomStateErrorImplCopyWith<_$ChatRoomStateErrorImpl> get copyWith =>
      __$$ChatRoomStateErrorImplCopyWithImpl<_$ChatRoomStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)
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
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
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
            List<MessageModel> messages,
            ConversationDetailResponseModel conversation,
            FriendStatusModel? friendStatus,
            int myType,
            int page,
            bool canLoadMore,
            bool? loadMoreError)?
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
    TResult Function(ChatRoomStateData value) $default, {
    required TResult Function(ChatRoomStateLoading value) loading,
    required TResult Function(ChatRoomStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ChatRoomStateData value)? $default, {
    TResult? Function(ChatRoomStateLoading value)? loading,
    TResult? Function(ChatRoomStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ChatRoomStateData value)? $default, {
    TResult Function(ChatRoomStateLoading value)? loading,
    TResult Function(ChatRoomStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatRoomStateError implements ChatRoomState {
  const factory ChatRoomStateError(final dynamic error) =
      _$ChatRoomStateErrorImpl;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$ChatRoomStateErrorImplCopyWith<_$ChatRoomStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
