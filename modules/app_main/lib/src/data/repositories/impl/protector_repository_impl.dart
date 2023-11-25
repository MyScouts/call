import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/protector_api.dart';
import 'package:app_main/src/data/repositories/protector_repository.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProtectorRepository)
class ProtectorRepositoryImpl extends ProtectorRepository {
  final ProtectorAPI protectorAPI;

  ProtectorRepositoryImpl(this.protectorAPI);

  @override
  Future<List<User>> list() async {
    final res = await protectorAPI.list();
    return res.users;
  }

  @override
  Future<List<ProtectorRequest>> requests() async {
    final res = await protectorAPI.requests();
    return res.requests;
  }

  @override
  Future<bool> replyRequest(Map<String, dynamic> payload) async {
    final res = await protectorAPI.replyRequest(payload);
    return res.result;
  }

  @override
  Future<ProtectorInfo?> myProtector() async {
    final res = await protectorAPI.myProtector();
    return res.info;
  }
}
