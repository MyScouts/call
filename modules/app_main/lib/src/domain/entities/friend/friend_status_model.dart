


import 'package:app_main/src/domain/entities/friend/relation_model.dart';
import 'package:app_main/src/domain/entities/friend/stats_model.dart';

abstract class FriendStatusModel {
  StatsModel get stats;
  RelationModel get relation;
}