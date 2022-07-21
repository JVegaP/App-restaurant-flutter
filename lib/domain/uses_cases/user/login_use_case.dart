import 'package:app_restaurant_flutter/domain/entities/user/user.dart';
import 'package:app_restaurant_flutter/domain/repositories/user/user_repository.dart';

///*
/// Class of use case by user of user
///*
class LoginUseCase {
  final UserRepository userRepository;
  LoginUseCase(this.userRepository);

  ///*
  /// Method for user user
  /// [email] this id email of user
  /// [password] this id password of user
  ///*
  Future<String> invoke(String email, String password) async{
    return await userRepository.loginUser (
        email,
        password
    );
  }
}