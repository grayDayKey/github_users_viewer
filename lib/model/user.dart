import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String login;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(includeIfNull: false)
  String email;

  User(
      {@required this.id,
      @required this.avatarUrl,
      @required this.login,
      this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
