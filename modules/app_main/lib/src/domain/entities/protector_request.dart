import 'package:app_core/app_core.dart';

enum ProtectorRequestStatus {
  unKnow(0),
  pending(1),
  accepted(2),
  rejected(3);

  const ProtectorRequestStatus(this.status);

  final int status;

  factory ProtectorRequestStatus.fromInt(int value) {
    switch (value) {
      case 0:
        return ProtectorRequestStatus.unKnow;
      case 1:
        return ProtectorRequestStatus.pending;
      case 2:
        return ProtectorRequestStatus.accepted;
      case 3:
        return ProtectorRequestStatus.rejected;
      default:
        throw ArgumentError('Invalid value for ProtectorRequestStatus: $value');
    }
  }
}

class ProtectorRequest {
  final int id;
  final User user;
  final ProtectorRequestStatus status;
  final DateTime createdAt;

  ProtectorRequest(this.id, this.user, this.status, this.createdAt);

  factory ProtectorRequest.fromJson(Map<String, dynamic> json) {
    return ProtectorRequest(
      json['id'],
      User.fromJson(json['user']),
      ProtectorRequestStatus.fromInt(json['status'] ?? 0),
      DateTime.tryParse(json['createdAt']) ?? DateTime.now(),
    );
  }
}
