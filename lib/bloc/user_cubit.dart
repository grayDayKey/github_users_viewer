import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/model/user.dart';

class UserCubit extends Cubit<User> {
  UsersApi _api;

  UserCubit(this._api) : super(null);

  Future<void> fetchUser(String userLogin) async {
    try {
      await _api.getUser(userLogin);
    } catch (e) {
      print(e);
    }
  }
}
