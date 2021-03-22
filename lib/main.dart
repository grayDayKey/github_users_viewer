import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/routing/routing.dart';
import 'package:provider/provider.dart';

import 'api/github_api.dart';

void main() async {
  final dio = Dio();
  final UsersApi usersApi = GitHubApi(dio);

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
      builder: (context, widget) {
        Widget error = Text('Something went wrong');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error,));
        }
        ErrorWidget.builder = (_) => error;
        return widget;
      },
    );
  }
}
