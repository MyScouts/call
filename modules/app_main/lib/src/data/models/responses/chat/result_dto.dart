import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_dto.g.dart';

@JsonSerializable()
class ResultDto extends ResultModel {
  factory ResultDto.fromJson(Map<String, dynamic> json) => _$ResultDtoFromJson(json);

  ResultDto({required this.result});

  Map<String, dynamic> toJson() => _$ResultDtoToJson(this);

  @override
  final dynamic result;
}
