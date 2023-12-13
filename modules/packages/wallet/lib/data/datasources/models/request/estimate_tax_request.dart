import 'package:freezed_annotation/freezed_annotation.dart';

part 'estimate_tax_request.g.dart';

@JsonSerializable()
class EstimateTaxRequest {
  final num value;

  EstimateTaxRequest({
    required this.value,
  });

  factory EstimateTaxRequest.fromJson(Map<String, dynamic> json) =>
      _$EstimateTaxRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateTaxRequestToJson(this);
}
