import 'package:json_annotation/json_annotation.dart';
part 'items_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ItemsResponse<T> {
  final int count;
  List<T>? items;

  ItemsResponse(this.count, this.items);

  factory ItemsResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ItemsResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ItemsResponseToJson(this, toJsonT);
}
