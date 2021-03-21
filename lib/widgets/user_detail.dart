import 'package:flutter/material.dart';
import 'package:github_users_viewer/routing/user_detail_route_arguments.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDetailRouteArguments arguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.userLogin),
      ),
      body: Text('hello'),
    );
  }
}
