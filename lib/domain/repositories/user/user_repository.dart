import 'package:app_restaurant_flutter/data/models/user/user_model.dart';
import 'package:app_restaurant_flutter/domain/entities/user/user.dart';

///*
///Implementation of method to consult the user information
///*
abstract class UserRepository {
  ///*
  /// Obtain user information register
  /// [email] this id email of user
  /// [password] this id password of user
  /// return : if is register return true, else false
  ///*
  Future<String> loginUser(String email, String password);

  ///*
  /// Register of new user
  /// [user] this is user model by register
  /// return : the code of response
  ///*
  Future<String> registerUser(UserModel user);
}