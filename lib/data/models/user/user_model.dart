import 'package:app_restaurant_flutter/domain/entities/user/user.dart';

class UserModel extends User {
  UserModel({
    required uid,
    required name,
    required email,
    required phone,
    required image,
    required password
  }) : super(
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      image: image,
      password: password
  );

  factory UserModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return UserModel(
      uid: parsedJson['uid'],
      name: parsedJson['name'].toString(),
      email: parsedJson['email'].toString(),
      phone: parsedJson['phone'].toString(),
      image: parsedJson['image'].toString(),
      password: parsedJson['password'].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['password'] = password;
    return data;
  }
}