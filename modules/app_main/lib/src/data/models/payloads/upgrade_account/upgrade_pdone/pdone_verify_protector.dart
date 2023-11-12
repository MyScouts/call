import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdone_verify_protector.g.dart';

@JsonSerializable()
class PDoneVerifyProtectorRequest {
  int? protector;
  String? phoneCode;
  String? phoneNumber;
  String? pDoneId;
  String? identityNumber;

  PDoneVerifyProtectorRequest({
    this.protector,
    this.phoneCode,
    this.phoneNumber,
    this.pDoneId,
    this.identityNumber,
  });

  factory PDoneVerifyProtectorRequest.fromJson(Map<String, dynamic> json) =>
      _$PDoneVerifyProtectorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PDoneVerifyProtectorRequestToJson(this);
}
