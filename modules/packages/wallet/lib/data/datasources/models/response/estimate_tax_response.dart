import 'package:freezed_annotation/freezed_annotation.dart';

part 'estimate_tax_response.g.dart';

@JsonSerializable()
class EstimateTaxResponse {
  final double? taxFeeVnd;
  final double? withdrawingVnd;

  EstimateTaxResponse({
    this.withdrawingVnd,
    this.taxFeeVnd,
  });

  factory EstimateTaxResponse.fromJson(Map<String, dynamic> json) =>
      _$EstimateTaxResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateTaxResponseToJson(this);
}
