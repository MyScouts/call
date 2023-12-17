// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_call_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CallUser _$CallUserFromJson(Map<String, dynamic> json) {
  return _CallUser.fromJson(json);
}

/// @nodoc
mixin _$CallUser {
  @JsonKey(name: 'userId', fromJson: asOrNull)
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', fromJson: asOrNull)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarUrl', fromJson: asOrNull)
  String? get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallUserCopyWith<CallUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallUserCopyWith<$Res> {
  factory $CallUserCopyWith(CallUser value, $Res Function(CallUser) then) =
      _$CallUserCopyWithImpl<$Res, CallUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId', fromJson: asOrNull) int? userId,
      @JsonKey(name: 'name', fromJson: asOrNull) String? name,
      @JsonKey(name: 'avatarUrl', fromJson: asOrNull) String? avatarUrl});
}

/// @nodoc
class _$CallUserCopyWithImpl<$Res, $Val extends CallUser>
    implements $CallUserCopyWith<$Res> {
  _$CallUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallUserImplCopyWith<$Res>
    implements $CallUserCopyWith<$Res> {
  factory _$$CallUserImplCopyWith(
          _$CallUserImpl value, $Res Function(_$CallUserImpl) then) =
      __$$CallUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId', fromJson: asOrNull) int? userId,
      @JsonKey(name: 'name', fromJson: asOrNull) String? name,
      @JsonKey(name: 'avatarUrl', fromJson: asOrNull) String? avatarUrl});
}

/// @nodoc
class __$$CallUserImplCopyWithImpl<$Res>
    extends _$CallUserCopyWithImpl<$Res, _$CallUserImpl>
    implements _$$CallUserImplCopyWith<$Res> {
  __$$CallUserImplCopyWithImpl(
      _$CallUserImpl _value, $Res Function(_$CallUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? name = freezed,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$CallUserImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CallUserImpl implements _CallUser {
  const _$CallUserImpl(
      {@JsonKey(name: 'userId', fromJson: asOrNull) this.userId,
      @JsonKey(name: 'name', fromJson: asOrNull) this.name,
      @JsonKey(name: 'avatarUrl', fromJson: asOrNull) this.avatarUrl});

  factory _$CallUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallUserImplFromJson(json);

  @override
  @JsonKey(name: 'userId', fromJson: asOrNull)
  final int? userId;
  @override
  @JsonKey(name: 'name', fromJson: asOrNull)
  final String? name;
  @override
  @JsonKey(name: 'avatarUrl', fromJson: asOrNull)
  final String? avatarUrl;

  @override
  String toString() {
    return 'CallUser(userId: $userId, name: $name, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallUserImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallUserImplCopyWith<_$CallUserImpl> get copyWith =>
      __$$CallUserImplCopyWithImpl<_$CallUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallUserImplToJson(
      this,
    );
  }
}

abstract class _CallUser implements CallUser {
  const factory _CallUser(
      {@JsonKey(name: 'userId', fromJson: asOrNull) final int? userId,
      @JsonKey(name: 'name', fromJson: asOrNull) final String? name,
      @JsonKey(name: 'avatarUrl', fromJson: asOrNull)
      final String? avatarUrl}) = _$CallUserImpl;

  factory _CallUser.fromJson(Map<String, dynamic> json) =
      _$CallUserImpl.fromJson;

  @override
  @JsonKey(name: 'userId', fromJson: asOrNull)
  int? get userId;
  @override
  @JsonKey(name: 'name', fromJson: asOrNull)
  String? get name;
  @override
  @JsonKey(name: 'avatarUrl', fromJson: asOrNull)
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$CallUserImplCopyWith<_$CallUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomCallData _$CustomCallDataFromJson(Map<String, dynamic> json) {
  return _CustomCallData.fromJson(json);
}

/// @nodoc
mixin _$CustomCallData {
  CallUser get caller => throw _privateConstructorUsedError;
  CallUser get callee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomCallDataCopyWith<CustomCallData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomCallDataCopyWith<$Res> {
  factory $CustomCallDataCopyWith(
          CustomCallData value, $Res Function(CustomCallData) then) =
      _$CustomCallDataCopyWithImpl<$Res, CustomCallData>;
  @useResult
  $Res call({CallUser caller, CallUser callee});

  $CallUserCopyWith<$Res> get caller;
  $CallUserCopyWith<$Res> get callee;
}

/// @nodoc
class _$CustomCallDataCopyWithImpl<$Res, $Val extends CustomCallData>
    implements $CustomCallDataCopyWith<$Res> {
  _$CustomCallDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caller = null,
    Object? callee = null,
  }) {
    return _then(_value.copyWith(
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as CallUser,
      callee: null == callee
          ? _value.callee
          : callee // ignore: cast_nullable_to_non_nullable
              as CallUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CallUserCopyWith<$Res> get caller {
    return $CallUserCopyWith<$Res>(_value.caller, (value) {
      return _then(_value.copyWith(caller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CallUserCopyWith<$Res> get callee {
    return $CallUserCopyWith<$Res>(_value.callee, (value) {
      return _then(_value.copyWith(callee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomCallDataImplCopyWith<$Res>
    implements $CustomCallDataCopyWith<$Res> {
  factory _$$CustomCallDataImplCopyWith(_$CustomCallDataImpl value,
          $Res Function(_$CustomCallDataImpl) then) =
      __$$CustomCallDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CallUser caller, CallUser callee});

  @override
  $CallUserCopyWith<$Res> get caller;
  @override
  $CallUserCopyWith<$Res> get callee;
}

/// @nodoc
class __$$CustomCallDataImplCopyWithImpl<$Res>
    extends _$CustomCallDataCopyWithImpl<$Res, _$CustomCallDataImpl>
    implements _$$CustomCallDataImplCopyWith<$Res> {
  __$$CustomCallDataImplCopyWithImpl(
      _$CustomCallDataImpl _value, $Res Function(_$CustomCallDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caller = null,
    Object? callee = null,
  }) {
    return _then(_$CustomCallDataImpl(
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as CallUser,
      callee: null == callee
          ? _value.callee
          : callee // ignore: cast_nullable_to_non_nullable
              as CallUser,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CustomCallDataImpl implements _CustomCallData {
  const _$CustomCallDataImpl({required this.caller, required this.callee});

  factory _$CustomCallDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomCallDataImplFromJson(json);

  @override
  final CallUser caller;
  @override
  final CallUser callee;

  @override
  String toString() {
    return 'CustomCallData(caller: $caller, callee: $callee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomCallDataImpl &&
            (identical(other.caller, caller) || other.caller == caller) &&
            (identical(other.callee, callee) || other.callee == callee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, caller, callee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomCallDataImplCopyWith<_$CustomCallDataImpl> get copyWith =>
      __$$CustomCallDataImplCopyWithImpl<_$CustomCallDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomCallDataImplToJson(
      this,
    );
  }
}

abstract class _CustomCallData implements CustomCallData {
  const factory _CustomCallData(
      {required final CallUser caller,
      required final CallUser callee}) = _$CustomCallDataImpl;

  factory _CustomCallData.fromJson(Map<String, dynamic> json) =
      _$CustomCallDataImpl.fromJson;

  @override
  CallUser get caller;
  @override
  CallUser get callee;
  @override
  @JsonKey(ignore: true)
  _$$CustomCallDataImplCopyWith<_$CustomCallDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallDataResult _$CallDataResultFromJson(Map<String, dynamic> json) {
  return _CallDataResult.fromJson(json);
}

/// @nodoc
mixin _$CallDataResult {
  @JsonKey(name: 'callerId', fromJson: asOrNull)
  String? get callerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'calleeId', fromJson: asOrNull)
  String? get calleeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'startTime', fromJson: asOrNull)
  DateTime? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'endTime', fromJson: asOrNull)
  DateTime? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isVideoCall', fromJson: asOrNull)
  bool? get isVideoCall => throw _privateConstructorUsedError;
  @JsonKey(name: 'callSignal', fromJson: asOrNull)
  String? get callSignal => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallDataResultCopyWith<CallDataResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallDataResultCopyWith<$Res> {
  factory $CallDataResultCopyWith(
          CallDataResult value, $Res Function(CallDataResult) then) =
      _$CallDataResultCopyWithImpl<$Res, CallDataResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'callerId', fromJson: asOrNull) String? callerId,
      @JsonKey(name: 'calleeId', fromJson: asOrNull) String? calleeId,
      @JsonKey(name: 'startTime', fromJson: asOrNull) DateTime? startTime,
      @JsonKey(name: 'endTime', fromJson: asOrNull) DateTime? endTime,
      @JsonKey(name: 'isVideoCall', fromJson: asOrNull) bool? isVideoCall,
      @JsonKey(name: 'callSignal', fromJson: asOrNull) String? callSignal,
      String type});
}

/// @nodoc
class _$CallDataResultCopyWithImpl<$Res, $Val extends CallDataResult>
    implements $CallDataResultCopyWith<$Res> {
  _$CallDataResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = freezed,
    Object? calleeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isVideoCall = freezed,
    Object? callSignal = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      callerId: freezed == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String?,
      calleeId: freezed == calleeId
          ? _value.calleeId
          : calleeId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVideoCall: freezed == isVideoCall
          ? _value.isVideoCall
          : isVideoCall // ignore: cast_nullable_to_non_nullable
              as bool?,
      callSignal: freezed == callSignal
          ? _value.callSignal
          : callSignal // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallDataResultImplCopyWith<$Res>
    implements $CallDataResultCopyWith<$Res> {
  factory _$$CallDataResultImplCopyWith(_$CallDataResultImpl value,
          $Res Function(_$CallDataResultImpl) then) =
      __$$CallDataResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'callerId', fromJson: asOrNull) String? callerId,
      @JsonKey(name: 'calleeId', fromJson: asOrNull) String? calleeId,
      @JsonKey(name: 'startTime', fromJson: asOrNull) DateTime? startTime,
      @JsonKey(name: 'endTime', fromJson: asOrNull) DateTime? endTime,
      @JsonKey(name: 'isVideoCall', fromJson: asOrNull) bool? isVideoCall,
      @JsonKey(name: 'callSignal', fromJson: asOrNull) String? callSignal,
      String type});
}

/// @nodoc
class __$$CallDataResultImplCopyWithImpl<$Res>
    extends _$CallDataResultCopyWithImpl<$Res, _$CallDataResultImpl>
    implements _$$CallDataResultImplCopyWith<$Res> {
  __$$CallDataResultImplCopyWithImpl(
      _$CallDataResultImpl _value, $Res Function(_$CallDataResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = freezed,
    Object? calleeId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isVideoCall = freezed,
    Object? callSignal = freezed,
    Object? type = null,
  }) {
    return _then(_$CallDataResultImpl(
      callerId: freezed == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String?,
      calleeId: freezed == calleeId
          ? _value.calleeId
          : calleeId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isVideoCall: freezed == isVideoCall
          ? _value.isVideoCall
          : isVideoCall // ignore: cast_nullable_to_non_nullable
              as bool?,
      callSignal: freezed == callSignal
          ? _value.callSignal
          : callSignal // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CallDataResultImpl implements _CallDataResult {
  const _$CallDataResultImpl(
      {@JsonKey(name: 'callerId', fromJson: asOrNull) this.callerId,
      @JsonKey(name: 'calleeId', fromJson: asOrNull) this.calleeId,
      @JsonKey(name: 'startTime', fromJson: asOrNull) this.startTime,
      @JsonKey(name: 'endTime', fromJson: asOrNull) this.endTime,
      @JsonKey(name: 'isVideoCall', fromJson: asOrNull) this.isVideoCall,
      @JsonKey(name: 'callSignal', fromJson: asOrNull) this.callSignal,
      required this.type});

  factory _$CallDataResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallDataResultImplFromJson(json);

  @override
  @JsonKey(name: 'callerId', fromJson: asOrNull)
  final String? callerId;
  @override
  @JsonKey(name: 'calleeId', fromJson: asOrNull)
  final String? calleeId;
  @override
  @JsonKey(name: 'startTime', fromJson: asOrNull)
  final DateTime? startTime;
  @override
  @JsonKey(name: 'endTime', fromJson: asOrNull)
  final DateTime? endTime;
  @override
  @JsonKey(name: 'isVideoCall', fromJson: asOrNull)
  final bool? isVideoCall;
  @override
  @JsonKey(name: 'callSignal', fromJson: asOrNull)
  final String? callSignal;
  @override
  final String type;

  @override
  String toString() {
    return 'CallDataResult(callerId: $callerId, calleeId: $calleeId, startTime: $startTime, endTime: $endTime, isVideoCall: $isVideoCall, callSignal: $callSignal, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallDataResultImpl &&
            (identical(other.callerId, callerId) ||
                other.callerId == callerId) &&
            (identical(other.calleeId, calleeId) ||
                other.calleeId == calleeId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isVideoCall, isVideoCall) ||
                other.isVideoCall == isVideoCall) &&
            (identical(other.callSignal, callSignal) ||
                other.callSignal == callSignal) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, callerId, calleeId, startTime,
      endTime, isVideoCall, callSignal, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallDataResultImplCopyWith<_$CallDataResultImpl> get copyWith =>
      __$$CallDataResultImplCopyWithImpl<_$CallDataResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallDataResultImplToJson(
      this,
    );
  }
}

abstract class _CallDataResult implements CallDataResult {
  const factory _CallDataResult(
      {@JsonKey(name: 'callerId', fromJson: asOrNull) final String? callerId,
      @JsonKey(name: 'calleeId', fromJson: asOrNull) final String? calleeId,
      @JsonKey(name: 'startTime', fromJson: asOrNull) final DateTime? startTime,
      @JsonKey(name: 'endTime', fromJson: asOrNull) final DateTime? endTime,
      @JsonKey(name: 'isVideoCall', fromJson: asOrNull) final bool? isVideoCall,
      @JsonKey(name: 'callSignal', fromJson: asOrNull) final String? callSignal,
      required final String type}) = _$CallDataResultImpl;

  factory _CallDataResult.fromJson(Map<String, dynamic> json) =
      _$CallDataResultImpl.fromJson;

  @override
  @JsonKey(name: 'callerId', fromJson: asOrNull)
  String? get callerId;
  @override
  @JsonKey(name: 'calleeId', fromJson: asOrNull)
  String? get calleeId;
  @override
  @JsonKey(name: 'startTime', fromJson: asOrNull)
  DateTime? get startTime;
  @override
  @JsonKey(name: 'endTime', fromJson: asOrNull)
  DateTime? get endTime;
  @override
  @JsonKey(name: 'isVideoCall', fromJson: asOrNull)
  bool? get isVideoCall;
  @override
  @JsonKey(name: 'callSignal', fromJson: asOrNull)
  String? get callSignal;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$CallDataResultImplCopyWith<_$CallDataResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
