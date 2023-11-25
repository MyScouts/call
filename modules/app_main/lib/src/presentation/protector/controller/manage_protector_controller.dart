import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/protector_request.dart';
import 'package:app_main/src/domain/usecases/protector_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class ManageProtectController extends ChangeNotifier {
  final ProtectorUseCase useCase;

  ManageProtectController(this.useCase) {
    _initData();
  }

  List<User> _users = [];

  List<User> get users => _users;

  set users(List<User> value) {
    _users = value;
    notifyListeners();
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _initData() async {
    try {
      final res = await useCase.list();
      users = res;
    } catch (e) {}
    isLoading = false;
  }
}

@injectable
class ListProtectorRequestController extends ChangeNotifier {
  final ProtectorUseCase useCase;

  ListProtectorRequestController(this.useCase) {
    _initData();
  }

  List<ProtectorRequest> _requests = [];

  List<ProtectorRequest> get requests => _requests;

  void _initData() async {
    try {
      final res = await useCase.requests();
      _requests = res
          .where(
            (e) => e.status == ProtectorRequestStatus.pending,
          )
          .toList();
    } catch (e) {}
    _isLoading = false;
    notifyListeners();
  }

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<bool> request(int id, bool value) async {
    final ok = await useCase.replyRequest({'id': id, 'isApproved': value});
    _initData();
    return ok;
  }
}
