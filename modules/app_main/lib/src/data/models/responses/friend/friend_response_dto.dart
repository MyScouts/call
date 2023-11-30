import 'package:app_main/src/data/models/responses/chat/member_dto.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'friend_response_dto.g.dart';

@JsonSerializable()
class FriendResponseDto extends FriendResponseModel {
  factory FriendResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseDtoFromJson(json);

  FriendResponseDto({required this.friends, required this.total});

  Map<String, dynamic> toJson() => _$FriendResponseDtoToJson(this);

  @override
  final List<MemberDto> friends;

  @override
  final int total;
}
