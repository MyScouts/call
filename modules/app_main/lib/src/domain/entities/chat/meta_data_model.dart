

import 'package:app_main/src/domain/entities/chat/member_meta_data_model.dart';

import 'file_model.dart';

abstract class MetaDataModel {
  FileModel? get file;
  List<String>? get images;
  MemberMetaDataModel? get member;
}