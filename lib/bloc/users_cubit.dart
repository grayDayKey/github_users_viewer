import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/model/user.dart';

class UsersCubit extends Cubit<UnmodifiableListView<User>> {
  final UsersApi _api;

  int _lastUserId = 0;

  UsersCubit(this._api) : super(UnmodifiableListView(List<User>.empty()));

  Future<void> fetchUsers() async {
    // TODO: handle error
    final users = await _api.getUsers(_lastUserId);
    _lastUserId = users.last.id;
    emit(UnmodifiableListView([...state, ...users]));
  }
}
