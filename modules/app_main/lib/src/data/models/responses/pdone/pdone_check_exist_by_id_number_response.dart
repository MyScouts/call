import 'package:freezed_annotation/freezed_annotation.dart';

part  'pdone_check_exist_by_id_number_response.g.dart';

@JsonSerializable()
class CheckExistIdentityNumber {
  final bool isExist;
  CheckExistIdentityNumber({
    required this.isExist,
  });

  factory CheckExistIdentityNumber.fromJson(Map<String, dynamic> json) =>
      _$CheckExistIdentityNumberFromJson(json);
}