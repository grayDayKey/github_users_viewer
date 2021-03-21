import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_users_viewer/api/test_api.dart';
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/routing/routing.dart';
import 'package:provider/provider.dart';

import 'api/github_api.dart';

void main() async {
  final dio = Dio();
  final UsersApi usersApi = kReleaseMode ? GitHubApi(dio) : TestApi();

  runApp(Provider(
    create: (context) => usersApi,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
    );
  }
}
