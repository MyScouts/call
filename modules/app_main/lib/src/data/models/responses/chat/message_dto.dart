

import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'member_dto.dart';
import 'meta_data_dto.dart';
part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto extends MessageModel {
  
  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);

  MessageDto({required this.conversationId, required this.createdAt, required this.message, required this.messageId, required this.metadata, required this.seen, required this.sender, required this.type});

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);

  @override
  final int conversationId;

  @override
  final DateTime createdAt;

  @override
  final String? message;

  @override
  final String messageId;

  @override
  final MetaDataDto? metadata;

  @override
  final bool seen;

  @override
  final MemberDto? sender;

  @override
  final int type;

  @override
  String? get des {
    String _des = '';
    switch (type) {
      case 2:
        _des = '[${sender?.displayName} đã tạo cuộc trò chuyện]';
    break;
      case 3:
        _des = '[${sender?.displayName} đã đổi tên cuộc trò chuyện]';
        break;
      case 5:
        _des = '[${metadata?.member?.displayName} đã rời khỏi cuộc trò chuyện]';
        break;
      case 6:
        _des = '[${metadata?.member?.displayName} đã tham gia cuộc trò chuyện]';
        break;
      case 7:
        _des = '[Quản trị viên đã nhượng quyền trưởng phòng cho ${metadata?.member?.displayName}';
        break;
        case 8:
        _des = '[Quản trị viên đã bầu ${metadata?.member?.displayName} làm phó phòng';
        break;
      case 9:
        _des = '[Quản trị viên đã xóa quyền phó phòng của ${metadata?.member?.displayName}';
        break;
        case 10:
        _des = '[Quản trị viên đã loại  ${metadata?.member?.displayName} khỏi đoạn chat';
        break;
    }
    return _des;
  }

}