import 'package:app_restaurant_flutter/data/models/user/user_model.dart';
import 'package:app_restaurant_flutter/domain/entities/user/user.dart';
import 'package:app_restaurant_flutter/domain/entities/user/users.dart';

class UsersModel extends Users {
  UsersModel({
    required List<User> users,
  }) : super(users: users);

  factory UsersModel.fromJson(List<dynamic> parsedJson) {
    return UsersModel(
      users: List<UserModel>.from(parsedJson.map((data) => UserModel.fromJson(data))),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[''] = List<dynamic>.from(users.map((user) => user));
    return data;
  }
}