

import 'package:app_main/src/data/models/responses/chat/file_dto.dart';
import 'package:app_main/src/domain/entities/chat/meta_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'meta_data_dto.g.dart';

@JsonSerializable()
class MetaDataDto extends MetaDataModel {

  factory MetaDataDto.fromJson(Map<String, dynamic> json) => _$MetaDataDtoFromJson(json);

  MetaDataDto({ this.file, this.images});

  Map<String, dynamic> toJson() => _$MetaDataDtoToJson(this);

  @override
  final FileDto? file;

  @override
  final List<String>? images;
}