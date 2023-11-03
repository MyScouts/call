import 'package:app_core/app_core.dart';

abstract class UserRepository {
  Future<User?> getProfile();
  Future<User?> getUserById({required int id});
}
