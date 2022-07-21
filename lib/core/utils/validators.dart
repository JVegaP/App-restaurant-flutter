import 'package:app_restaurant_flutter/core/utils/strings.dart';

class Validators {

  /// Validator of email
  static String validatorEmail(String email) {
    String messageValidatorEmail = '';
    if (!RegExp(Strings.expRegularEmail).hasMatch(email)) {
      messageValidatorEmail = Strings.messageEmailInvalid;
    }
    if (email.isEmpty) {
      messageValidatorEmail = Strings.messageTextInputEmpty;
    }
    return messageValidatorEmail;
  }

  /// Validator of password
  static String validatorPassword(String password) {
    String messageValidatorPassword = '';
    if (password.isEmpty) {
      messageValidatorPassword = Strings.messageTextInputEmpty;
    }
    return messageValidatorPassword;
  }

  /// Validator of password
  static String validatorPasswordRegister(String password) {
    String messageValidatorPassword = '';
    if (password.length < 6) {
      messageValidatorPassword = Strings.messagePasswordInvalid;
    }
    return messageValidatorPassword;
  }

  /// Validator of name
  static String validatorName(String name) {
    String messageValidatorName = '';
    if (name.isEmpty) {
      messageValidatorName = Strings.messageTextInputEmpty;
    }
    return messageValidatorName;
  }

  /// Validator of phone
  static String validatorPhone(String phone) {
    String messageValidatorPhone = '';
    if (phone.length < 10) {
      messageValidatorPhone = Strings.messagePhoneInvalid;
    }
    return messageValidatorPhone;
  }

  /// Validator form register
  static bool validatorFormRegister(String email, String password, String name, String phone) {
    if(validatorEmail(email).isEmpty &&
    validatorName(name).isEmpty &&
    validatorPasswordRegister(password).isEmpty &&
    validatorPhone(phone).isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}