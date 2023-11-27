import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'friend_dto.g.dart';

@JsonSerializable()
class FriendDto extends FriendModel {
  factory FriendDto.fromJson(Map<String, dynamic> json) => _$FriendDtoFromJson(json);

  FriendDto(
      {this.avatar,
      this.birthday,
      this.displayName,
      this.fullName,
      this.id,
      this.pDoneId,
      this.sexCode});

  Map<String, dynamic> toJson() => _$FriendDtoToJson(this);

  @override
  final String? avatar;
  @override
  final String? birthday;

  @override
  final String? displayName;

  @override
  final String? fullName;

  @override
  final int? id;

  @override
  final String? pDoneId;

  @override
  final int? sexCode;
}
