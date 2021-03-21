import 'package:github_users_viewer/model/user.dart';

abstract class UsersApi {
  Future<List<User>> getUsers(int id);
  Future<User> getUser(String login);
}
