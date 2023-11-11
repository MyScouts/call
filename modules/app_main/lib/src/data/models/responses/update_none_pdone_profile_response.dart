import 'package:app_main/src/domain/entities/update_account/pdone_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_none_pdone_profile_response.freezed.dart';
part 'update_none_pdone_profile_response.g.dart';

class UpdateNonePDoneProfileReponse with _$UpdateNonePDoneProfileReponse {
  // Constructor to initialize the model
  const factory UpdateNonePDoneProfileReponse({
    required Map<String, PDoneProfile> profile,
  }) = _UpdateNonePDoneProfileReponse;

  factory UpdateNonePDoneProfileReponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateNonePDoneProfileReponseFromJson(json);
}
