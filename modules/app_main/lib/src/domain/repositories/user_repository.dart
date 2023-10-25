import '../entities/user.dart';

abstract class UserRepository {

  Future<User?> getUserById({required int id});

  Future<bool> delete(int id, String password);

  Future<bool> blockUser(int userId);

  Future<bool> hideDiaryUser(int userId);

  Future<bool> sendReport(int id, String content);

  Future<bool> unblockUser(int id);

  Future<bool> removeHideDiaryUser(int id);

  Future<List<User>> relatedParticipants({
    required int page,
    required int pageSize,
    String? keyword,
    List<User> ignoreUsers = const [],
  });

  Future<User> userChatInfo(int id);
}
