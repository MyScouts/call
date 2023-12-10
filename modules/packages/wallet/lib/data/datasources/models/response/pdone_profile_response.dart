import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet/presentation/shared/model/infomation_pdone_profile.dart';

part 'pdone_profile_response.g.dart';

@JsonSerializable()
class PDoneProfileResponse {
  final PDoneProfile? profile;

  PDoneProfileResponse({this.profile});

  factory PDoneProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PDoneProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PDoneProfileResponseToJson(this);
}
