import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
