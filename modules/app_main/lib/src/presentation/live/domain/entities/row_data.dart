import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'row_data.g.dart';

@JsonSerializable(explicitToJson: true)
class RowsData {
  final int? userId;
  final int? followerId;
  final int? status;
  final bool? isFriend;
  final int? id;
  final User? userFollow;

  RowsData(this.userId, this.followerId, this.status, this.isFriend, this.id, this.userFollow);

  factory RowsData.fromJson(Map<String, dynamic> json) => _$RowsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RowsDataToJson(this);
}
