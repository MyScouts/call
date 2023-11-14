
import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';

abstract class ProtectorRepository {
  Future<List<User>> list();

  Future<List<ProtectorRequest>> requests();

  Future<bool> replyRequest(Map<String, dynamic> payload);
}