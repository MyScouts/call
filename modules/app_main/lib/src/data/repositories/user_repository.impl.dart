import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote/user_api.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<User?> getUserById({required int id}) async {
    final res = await _userApi.getUserById(id: id);

    return res.data;
  }

  @override
  Future<bool> delete(int id, String password) async {
    final result = await _userApi.delete(
      id: id,
      payload: {'password': password},
    );
    return result.data;
  }

  @override
  Future<bool> blockUser(int userId) async {
    final result = await _userApi.blockUser(id: userId);

    return result.success;
  }

  @override
  Future<bool> hideDiaryUser(int userId) async {
    final result = await _userApi.hideDiaryUser(id: userId);

    return result.success;
  }

  @override
  Future<bool> sendReport(int id, String content) async {
    final resposne =
        await _userApi.reportUser(id: id, body: {'content': content});

    return resposne.data;
  }

  @override
  Future<bool> unblockUser(int id) async {
    final res = await _userApi.unblockUser(id);

    return res.data;
  }

  @override
  Future<bool> removeHideDiaryUser(int id) async {
    final res = await _userApi.removeHideDiaryUser(id);

    return res.data;
  }

  @override
  Future<List<User>> relatedParticipants({
    required int page,
    required int pageSize,
    String? keyword,
    List<User> ignoreUsers = const [],
  }) async {
    final ignoreUserIds = ignoreUsers
        .where((e) => e.id != null)
        .map((e) => e.id!.toString())
        .join(',');

    final response = await _userApi.relatedParticipants(
      page: page,
      pageSize: pageSize,
      keyword: keyword,
      ignoreUserIds: ignoreUserIds,
    );

    return response.data;
  }

  @override
  Future<User> userChatInfo(int id) async {
    final response = await _userApi.userChatInfo(id);
    return response.data;
  }
}
