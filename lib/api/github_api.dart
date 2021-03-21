import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:github_users_viewer/api/users_api.dart';
import 'package:github_users_viewer/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'github_api.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
@Headers({'Accept': 'application/vnd.github.v3+json'})
abstract class GitHubApi implements UsersApi {
  factory GitHubApi(Dio dio, {String baseUrl}) = _GitHubApi;
  @GET('/users')
  Future<List<User>> getUsers(@Query('since') int id);

  @GET('/users/{user}')
  Future<User> getUser(@Path('user') String login);
}
