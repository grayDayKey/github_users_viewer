import 'package:flutter/material.dart';
import 'package:github_users_viewer/model/user.dart';
import 'package:github_users_viewer/routing/routing.dart';
import 'package:github_users_viewer/routing/user_detail_route_arguments.dart';

class UserListCard extends StatelessWidget {
  final User user;

  const UserListCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () => Navigator.pushNamed(context, kUserDetailRouteName,
          arguments: UserDetailRouteArguments(user.login)),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.avatarUrl,
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                user.login,
                style: TextStyle(fontSize: 16),
              ))
            ],
          )));
}
