import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';

class ListProtectorResponse {
  final List<User> users;

  ListProtectorResponse(this.users);

  factory ListProtectorResponse.fromJson(Map<String, dynamic> json) {
    return ListProtectorResponse(
      List<User>.from(
          (json['protectors'] ?? []).map((e) => User.fromJson(e['user']))),
    );
  }
}

class ListProtectorRequestResponse {
  final List<ProtectorRequest> requests;

  ListProtectorRequestResponse(this.requests);

  factory ListProtectorRequestResponse.fromJson(Map<String, dynamic> json) {
    return ListProtectorRequestResponse(
      List<ProtectorRequest>.from(
          (json['requests'] ?? []).map((e) => ProtectorRequest.fromJson(e))),
    );
  }
}

class ReplyRequestResponse {
  final bool result;

  ReplyRequestResponse(this.result);

  factory ReplyRequestResponse.fromJson(Map<String, dynamic> json) {
    return ReplyRequestResponse(json['result']);
  }
}