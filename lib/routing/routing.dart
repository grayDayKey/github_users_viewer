import 'package:flutter/material.dart';
import 'package:github_users_viewer/widgets/user_detail.dart';
import 'package:github_users_viewer/widgets/users.dart';

const kHomeRouteName = '/';
const kUserDetailRouteName = '/user';

Map<String, WidgetBuilder> get appRoutes => {
      kHomeRouteName: (context) => const Users(),
      kUserDetailRouteName: (context) => const UserDetail(),
    };
