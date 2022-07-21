import 'dart:convert';
import 'package:app_restaurant_flutter/core/utils/preferences.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/data/models/user/user_model.dart';
import 'package:app_restaurant_flutter/data/models/user/users_model.dart';
import 'package:app_restaurant_flutter/domain/entities/user/user.dart';
import 'package:app_restaurant_flutter/domain/repositories/user/user_repository.dart';

final prefs = Preferences();
class UserDataSource extends UserRepository {

  ///*
  ///Call to BD local by user user
  /// [email] this id email of user
  /// [password] this id password of user
  ///*
  @override
  Future<String> loginUser(String email, String password) async{
    var response = "";
    if(prefs.users=="0") {
      response = Strings.failedCodeUserNoExists;
    } else {
      UsersModel usersModel = UsersModel(users: []);
      var decodeJSON = jsonDecode(prefs.users);
      usersModel = UsersModel.fromJson(decodeJSON);
      if(usersModel.users.isNotEmpty) {
        for (var user in usersModel.users) {
          if(user.email==email && user.password==password) {
            prefs.user = jsonEncode(user);
            return Strings.successCode;
          } else {
            response = Strings.failedCodeErrorCredentials;
          }
        }
      } else {
        response = Strings.failedCodeUserNoExists;
      }
    }
    return response;
  }

  ///*
  ///Call to BD local by register user
  /// [user] this is user model by register
  ///*
  @override
  Future<String> registerUser(UserModel user) async{
    List<User> users = [];
    if(prefs.users=="0") {
      users.add(user);
      prefs.users = jsonEncode(users);
      prefs.user = jsonEncode(user);
      return Strings.successCode;
    } else {
      UsersModel usersModel = UsersModel(users: []);
      var decodeJSON = jsonDecode(prefs.users);
      usersModel = UsersModel.fromJson(decodeJSON);
      users = usersModel.users;
      for (var item in users) {
        if(item.email==user.email) {
          return Strings.failedCodeUserExists;
        }
      }
      users.add(user);
      prefs.users = jsonEncode(users);
      prefs.user = jsonEncode(user);
      return Strings.successCode;
    }
  }

}