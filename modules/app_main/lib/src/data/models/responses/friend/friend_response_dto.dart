import 'package:json_annotation/json_annotation.dart';

import 'friend_dto.dart';
part 'friend_response_dto.g.dart';

@JsonSerializable()
class FriendResponseDto {
  factory FriendResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseDtoFromJson(json);

  FriendResponseDto({required this.friends, required this.total});

  Map<String, dynamic> toJson() => _$FriendResponseDtoToJson(this);

  final List<FriendDto> friends;
  final int total;
}
