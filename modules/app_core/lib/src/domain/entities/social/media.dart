
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';

part 'media.g.dart';
@freezed
class Media with _$Media {
  const factory Media({
    int? id,
    String? link,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
