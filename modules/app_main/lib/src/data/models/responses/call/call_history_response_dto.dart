import 'package:app_main/src/data/models/responses/call/call_history_dto.dart';
import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'call_history_response_dto.g.dart';

@JsonSerializable()
class CallHistoryResponseDto extends CallHistoryResponseModel {
  factory CallHistoryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CallHistoryResponseDtoFromJson(json);

  CallHistoryResponseDto({required this.count, required this.items});

  Map<String, dynamic> toJson() => _$CallHistoryResponseDtoToJson(this);

  @override
  final int count;
  @override
  final List<CallHistoryDto> items;
}
