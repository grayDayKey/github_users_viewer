import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/bloc/users_cubit.dart';
import 'package:github_users_viewer/widgets/user_list.dart';

class Users extends StatelessWidget {
  const Users({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('GitHub users'),
        ),
        body: BlocProvider(
          create: (context) => UsersCubit(context.read<UsersApi>()),
          child: const UserList(),
        ),
      );
}
