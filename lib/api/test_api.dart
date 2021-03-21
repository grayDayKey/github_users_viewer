import 'dart:math';

import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/model/user.dart';

class TestApi implements UsersApi {
  int _id = 0;

  final _avatarUrl =
      'https://upload.wikimedia.org/wikipedia/commons/c/c0/Nicolas_Cage_Deauville_2013.jpg';

  @override
  Future<User> getUser(String login) async {
    return User(
        id: _id++,
        avatarUrl: _avatarUrl,
        login: 'User' + Random().nextInt(30).toString());
  }

  @override
  Future<List<User>> getUsers(int id) async {
    return List<User>.generate(
        30,
        (index) => User(
            id: _id++,
            avatarUrl: _avatarUrl,
            login: 'User' + Random().nextInt(30).toString()));
  }
}
