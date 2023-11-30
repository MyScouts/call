
import 'package:app_main/src/domain/entities/chat/file_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'file_dto.g.dart';

@JsonSerializable()
class FileDto extends FileModel {

  factory FileDto.fromJson(Map<String, dynamic> json) => _$FileDtoFromJson(json);

  FileDto({required this.name, required this.path});

  Map<String, dynamic> toJson() => _$FileDtoToJson(this);

  @override
  final String name;

  @override
  final String path;
}