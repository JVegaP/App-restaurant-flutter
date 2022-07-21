import 'dart:math';

import 'package:app_restaurant_flutter/data/models/user/user_model.dart';
import 'package:app_restaurant_flutter/domain/repositories/user/user_repository.dart';

///*
/// Class of use case by register of user
///*
class RegisterUseCase {
  final UserRepository userRepository;
  RegisterUseCase(this.userRepository);

  ///*
  /// Method for user register
  /// [user] this is user model by register
  ///*
  Future<String> invoke(String name, String email, String phone, String password) async{
    UserModel user = _createUser(name, email, phone, password);
    return await userRepository.registerUser (
        user
    );
  }

  UserModel _createUser(String name, String email, String phone, String password) {
    Random random =  Random();
    int uid = random.nextInt(1000);
    return UserModel(
        uid: uid.toString(),
        name: name,
        email: email,
        phone: phone,
        image: "profile.png",
        password: password
    );
  }

}