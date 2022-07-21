import 'dart:convert';
import 'package:app_restaurant_flutter/core/utils/preferences.dart';
import 'package:app_restaurant_flutter/core/utils/routes.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/data/models/user/user_model.dart';
import 'package:app_restaurant_flutter/data/sources/local_source/user_data_source.dart';
import 'package:app_restaurant_flutter/domain/entities/user/user.dart';
import 'package:app_restaurant_flutter/domain/uses_cases/user/login_use_case.dart';
import 'package:app_restaurant_flutter/domain/uses_cases/user/register_use_case.dart';
import 'package:flutter/material.dart';

final prefs = Preferences();
class UserProvider with ChangeNotifier {
  late LoginUseCase loginUseCase;
  late RegisterUseCase registerUseCase;
  late UserDataSource userDataSource;
  UserProvider (){
    userDataSource = UserDataSource();
    loginUseCase = LoginUseCase(userDataSource);
    registerUseCase = RegisterUseCase(userDataSource);
  }

  String? _messageValidatorEmail;
  String get messageValidatorEmail {
    return _messageValidatorEmail??'';
  }
  set messageValidatorEmail(String messageValidatorEmail) {
    _messageValidatorEmail = messageValidatorEmail;
    notifyListeners();
  }

  String? _messageValidatorPassword;
  String get messageValidatorPassword {
    return _messageValidatorPassword??'';
  }
  set messageValidatorPassword(String messageValidatorPassword) {
    _messageValidatorPassword = messageValidatorPassword;
    notifyListeners();
  }

  String? _messageValidatorName;
  String get messageValidatorName {
    return _messageValidatorName??'';
  }
  set messageValidatorName(String messageValidatorName) {
    _messageValidatorName = messageValidatorName;
    notifyListeners();
  }

  String? _messageValidatorPhone;
  String get messageValidatorPhone {
    return _messageValidatorPhone??'';
  }
  set messageValidatorPhone(String messageValidatorPhone) {
    _messageValidatorPhone = messageValidatorPhone;
    notifyListeners();
  }

  late User _user;
  User get user {
    return _user;
  }
  set user(User user) {
    _user = user;
    notifyListeners();
  }

  /// Clean messages of validation
  clearValidator() {
    _messageValidatorEmail = "";
    _messageValidatorName = "";
    _messageValidatorPassword = "";
    _messageValidatorPhone = "";
    notifyListeners();
  }

  /// Request of login user by email
  login(BuildContext context, String email, String password) async{
    await loginUseCase.invoke(email, password).then((value) {
      switch (value) {
        case Strings.successCode :
          var decodeJSON = jsonDecode(prefs.user);
          user = UserModel.fromJson(decodeJSON);
          routes.openHomeScreen(context);
          break;
        case Strings.failedCodeErrorCredentials :
          routes.openAlert(context, Strings.messageLoginInvalidData);
          break;
        case Strings.failedCodeUserNoExists :
          routes.openAlert(context, Strings.messageLoginInvalid);
          break;
        case Strings.failedCode :
          routes.openAlert(context, Strings.messageRegisterInvalid);
      }
    });
  }

  /// Request of register user
  register(BuildContext context, String email, String password, String name, String phone) async{
    await registerUseCase.invoke(name, email, phone, password).then((value) {
      switch (value) {
        case Strings.successCode :
          var decodeJSON = jsonDecode(prefs.user);
          user = UserModel.fromJson(decodeJSON);
          routes.openHomeScreen(context);
          break;
        case Strings.failedCodeUserExists :
          routes.openAlert(context, Strings.messageUserExist);
          break;
        case Strings.failedCode :
          routes.openAlert(context, Strings.messageRegisterInvalid);
      }
    });
  }
}