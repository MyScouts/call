// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ask_join_team_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AskJoinTeamResponse _$AskJoinTeamResponseFromJson(Map<String, dynamic> json) {
  return _JoinRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$AskJoinTeamResponse {
  int get requestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AskJoinTeamResponseCopyWith<AskJoinTeamResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AskJoinTeamResponseCopyWith<$Res> {
  factory $AskJoinTeamResponseCopyWith(
          AskJoinTeamResponse value, $Res Function(AskJoinTeamResponse) then) =
      _$AskJoinTeamResponseCopyWithImpl<$Res, AskJoinTeamResponse>;
  @useResult
  $Res call({int requestId});
}

/// @nodoc
class _$AskJoinTeamResponseCopyWithImpl<$Res, $Val extends AskJoinTeamResponse>
    implements $AskJoinTeamResponseCopyWith<$Res> {
  _$AskJoinTeamResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinRequestResponseImplCopyWith<$Res>
    implements $AskJoinTeamResponseCopyWith<$Res> {
  factory _$$JoinRequestResponseImplCopyWith(_$JoinRequestResponseImpl value,
          $Res Function(_$JoinRequestResponseImpl) then) =
      __$$JoinRequestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int requestId});
}

/// @nodoc
class __$$JoinRequestResponseImplCopyWithImpl<$Res>
    extends _$AskJoinTeamResponseCopyWithImpl<$Res, _$JoinRequestResponseImpl>
    implements _$$JoinRequestResponseImplCopyWith<$Res> {
  __$$JoinRequestResponseImplCopyWithImpl(_$JoinRequestResponseImpl _value,
      $Res Function(_$JoinRequestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$JoinRequestResponseImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRequestResponseImpl implements _JoinRequestResponse {
  const _$JoinRequestResponseImpl({required this.requestId});

  factory _$JoinRequestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRequestResponseImplFromJson(json);

  @override
  final int requestId;

  @override
  String toString() {
    return 'AskJoinTeamResponse(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRequestResponseImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRequestResponseImplCopyWith<_$JoinRequestResponseImpl> get copyWith =>
      __$$JoinRequestResponseImplCopyWithImpl<_$JoinRequestResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRequestResponseImplToJson(
      this,
    );
  }
}

abstract class _JoinRequestResponse implements AskJoinTeamResponse {
  const factory _JoinRequestResponse({required final int requestId}) =
      _$JoinRequestResponseImpl;

  factory _JoinRequestResponse.fromJson(Map<String, dynamic> json) =
      _$JoinRequestResponseImpl.fromJson;

  @override
  int get requestId;
  @override
  @JsonKey(ignore: true)
  _$$JoinRequestResponseImplCopyWith<_$JoinRequestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
