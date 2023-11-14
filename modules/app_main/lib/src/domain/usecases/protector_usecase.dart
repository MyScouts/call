import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/repositories/protector_repository.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProtectorUseCase {
  final ProtectorRepository repository;

  ProtectorUseCase(this.repository);

  Future<List<User>> list() => repository.list();

  Future<List<ProtectorRequest>> requests() => repository.requests();

  Future<bool> replyRequest(Map<String, dynamic> json) {
    return repository.replyRequest(json);
  }
}
