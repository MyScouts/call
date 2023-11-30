import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';

abstract class LiveMessageData {
  final String message;
  final DateTime createdAt;

  LiveMessageData({
    required this.message,
    required this.createdAt,
  });
}

class JoinMessage extends LiveMessageData {
  final LiveMember member;

  JoinMessage({
    required this.member,
    required super.message,
    required super.createdAt,
  });
}

class SystemMessage extends LiveMessageData {
  SystemMessage({
    required super.message,
    required super.createdAt,
  });
}

class UserMessage extends LiveMessageData {
  final LiveMember member;

  UserMessage({
    required this.member,
    required super.message,
    required super.createdAt,
  });
}
