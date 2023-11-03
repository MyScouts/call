import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/remote/user_api.dart';
import 'package:app_main/src/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class AuthRepositoryImpl extends UserRepository {
  final UserApi _userAPI;

  AuthRepositoryImpl(
    this._userAPI,
  );

  @override
  Future<User?> getProfile() async {
    final res = await _userAPI.getProfile();
    return res.data;
  }

  @override
  Future<User?> getUserById({required int id}) async {
    final res = await _userAPI.getUserById(id: id);

    return res.data;
  }
}
