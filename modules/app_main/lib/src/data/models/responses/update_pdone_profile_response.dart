import 'package:app_main/src/domain/entities/update_account/information_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_pdone_profile_response.freezed.dart';
part 'update_pdone_profile_response.g.dart';

@freezed
class UpdatePDoneProfileReponse with _$UpdatePDoneProfileReponse {
  const factory UpdatePDoneProfileReponse({
    required Map<String, InformationProfile> profile,
  }) = _UpdatePDoneProfileReponse;

  factory UpdatePDoneProfileReponse.fromJson(Map<String, dynamic> json) => _$UpdatePDoneProfileReponseFromJson(json);
}
