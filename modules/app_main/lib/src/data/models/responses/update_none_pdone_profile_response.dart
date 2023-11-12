import 'package:app_main/src/domain/entities/update_account/information_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_none_pdone_profile_response.freezed.dart';
part 'update_none_pdone_profile_response.g.dart';

@freezed
class UpdateNonePDoneProfileReponse with _$UpdateNonePDoneProfileReponse {
  // Constructor to initialize the model
  const factory UpdateNonePDoneProfileReponse({
    required Map<String, InformationProfile> profile,
  }) = _UpdateNonePDoneProfileReponse;

  factory UpdateNonePDoneProfileReponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNonePDoneProfileReponseFromJson(json);
}
