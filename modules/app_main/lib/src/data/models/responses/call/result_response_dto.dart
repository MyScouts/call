import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_response_dto.g.dart';

@JsonSerializable()
class ResultResponseDto extends ResultResponseModel {
  factory ResultResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseDtoFromJson(json);

  ResultResponseDto({required this.result});

  Map<String, dynamic> toJson() => _$ResultResponseDtoToJson(this);

  @override
  final int result;
}
