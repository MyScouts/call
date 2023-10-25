import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? username;
  final String? name;
  final String? nickname;
  final String? email;
  final String? phone;
  final String? avatar;

  User({
    this.id,
    this.username,
    this.name,
    this.nickname,
    this.email,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
