import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? name,
    String? nickname,
    String? email,
    String? phone,
    String? avatar,
    int? status,
    String? pDoneId,
    String? displayName,
    bool? isPDone,
    List<String>? backgroundImages,
    String? defaultBackground,
    bool? isJA,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtNull on User? {
  String get getdisplayName => [this?.displayName, _userDefaultName]
      .firstWhereOrNull((e) => e != null && e.isNotEmpty)!;
}

const _userDefaultName = 'PDone User';

int calculateAge(DateTime birthDate) {
  final currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  final month1 = currentDate.month;
  final month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    final day1 = currentDate.day;
    final day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

enum Sex {
  @JsonValue('Nam')
  male('Nam'),
  @JsonValue('Nữ')
  female('Nữ'),
  @JsonValue('Khác')
  other('Khác'),
  @JsonValue('Không xác định`')
  unknown('Không xác định`'),
  ;

  final String title;

  const Sex(this.title);
}
