import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdone_request_protector_req.g.dart';

@JsonSerializable()
class PDoneRequestProtectorReq {
  int? protectorId;
  int? relation;

  PDoneRequestProtectorReq({
    this.protectorId,
    this.relation,
  });

  factory PDoneRequestProtectorReq.fromJson(Map<String, dynamic> json) =>
      _$PDoneRequestProtectorReqFromJson(json);

  Map<String, dynamic> toJson() => _$PDoneRequestProtectorReqToJson(this);
}
