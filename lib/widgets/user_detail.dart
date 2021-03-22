import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_viewer/routing/user_detail_route_arguments.dart';

import '../api/users_api.dart';
import '../model/user.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UserDetailRouteArguments arguments =
        ModalRoute.of(context).settings.arguments;
    final UsersApi api = context.read<UsersApi>();
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.userLogin),
      ),
      body: FutureBuilder<User>(
        future: api.getUser(arguments.userLogin),
        builder: (context, snapshot) => snapshot.hasData ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Image.network(
                snapshot.data.avatarUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 16.0),
              child: Text('Login: ' + snapshot.data.login, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Email: ' + (snapshot.data?.email ?? 'Email is Private')),
            ),
          ],
        ) : Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
