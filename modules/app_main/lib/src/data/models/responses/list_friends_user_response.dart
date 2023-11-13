import 'package:app_core/app_core.dart';

class ListFriendUserResponse {
  final List<User> users;

  ListFriendUserResponse(this.users);

  factory ListFriendUserResponse.fromJson(Map<String, dynamic> json) {
    return ListFriendUserResponse(
      List<User>.from((json['data']?['rows'] ?? []).map(
            (e) => User.fromJson(Map<String, dynamic>.from(e['userFollow'])),
      )),
    );
  }
}
