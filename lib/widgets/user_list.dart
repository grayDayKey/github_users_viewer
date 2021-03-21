import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users_viewer/bloc/users_cubit.dart';
import 'package:github_users_viewer/model/user.dart';
import 'package:github_users_viewer/widgets/user_list_card.dart';

const double _kDividerIndent = 56.0;

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ScrollController _scrollController;
  UsersCubit _usersCubit;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    _usersCubit = BlocProvider.of<UsersCubit>(context);
    super.initState();
    _usersCubit.fetchUsers();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _usersCubit = BlocProvider.of<UsersCubit>(context);
    super.didChangeDependencies();
  }

  Future<void> _handleScroll() async {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      await _usersCubit.fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UsersCubit, UnmodifiableListView<User>>(
        builder: (context, users) => ListView.separated(
          controller: _scrollController,
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: _kDividerIndent,
          ),
          itemBuilder: (context, index) => index + 1 == users.length
              ? CircularProgressIndicator()
              : UserListCard(user: users.elementAt(index)),
        ),
      );
}
