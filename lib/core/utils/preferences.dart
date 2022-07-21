import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();
  factory Preferences() {
    return _instance;
  }
  Preferences._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /*Users*/
  String get users {
    return _prefs.getString('users') ?? "0";
  }
  set users(String value) {
    _prefs.setString('users', value);
  }

  /*User*/
  String get user {
    return _prefs.getString('user') ?? "0";
  }
  set user(String value) {
    _prefs.setString('user', value);
  }
}