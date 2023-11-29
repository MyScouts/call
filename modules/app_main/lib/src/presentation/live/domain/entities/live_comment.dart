import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';

enum LiveCommentType {
  join,
  message,
}

class LiveComment {
  final LiveMember member;
  final String message;
  final LiveCommentType type;
  final DateTime createdAt;

  LiveComment({
    required this.member,
    required this.message,
    required this.type,
    required this.createdAt,
  });
}
