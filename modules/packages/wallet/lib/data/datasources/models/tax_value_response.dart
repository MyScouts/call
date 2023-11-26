import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_value_response.g.dart';

@JsonSerializable()
class TaxResponse {
  final num taxValue;

  TaxResponse({required this.taxValue});

  factory TaxResponse.fromJson(Map<String, dynamic> json) =>
      _$TaxResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TaxResponseToJson(this);
}
