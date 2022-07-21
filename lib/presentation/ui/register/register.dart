import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/routes.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/core/utils/validators.dart';
import 'package:app_restaurant_flutter/presentation/provider/user/user_provider.dart';
import 'package:app_restaurant_flutter/presentation/widgets/button_custom.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_input_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key? key}) : super(key: key);
  @override
  Register createState()=> Register();
}

class Register extends State<RegisterPage> with SingleTickerProviderStateMixin{
  UserProvider? provider;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    provider = Provider.of<UserProvider>(context,listen: false);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    pwdController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UserProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.05,
            image: AssetImage("assets/images/image_background.png")
          )
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    FadeInDown(
                      delay: const Duration(milliseconds: 250),
                      duration: const Duration(milliseconds: 500),
                      child: TextInputCustom(
                        placeHolder: Strings.name,
                        controller: nameController,
                        keyboard: TextInputType.text,
                        validationText: provider?.messageValidatorName,
                        onChanged: (value) {
                          provider?.messageValidatorName = Validators.validatorName(nameController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInDown(
                      delay: const Duration(milliseconds: 250),
                      duration: const Duration(milliseconds: 500),
                      child: TextInputCustom(
                        placeHolder: Strings.phone,
                        controller: phoneController,
                        keyboard: TextInputType.number,
                        validationText: provider?.messageValidatorPhone,
                        onChanged: (value) {
                          provider?.messageValidatorPhone = Validators.validatorPhone(phoneController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInDown(
                      delay: const Duration(milliseconds: 250),
                      duration: const Duration(milliseconds: 500),
                      child: TextInputCustom(
                        placeHolder: Strings.email,
                        controller: emailController,
                        keyboard: TextInputType.emailAddress,
                        validationText: provider?.messageValidatorEmail,
                        onChanged: (value) {
                          provider?.messageValidatorEmail = Validators.validatorEmail(emailController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInDown(
                      delay: const Duration(milliseconds: 250),
                      duration: const Duration(milliseconds: 500),
                      child: TextInputCustom(
                        placeHolder: Strings.password,
                        controller: pwdController,
                        keyboard: TextInputType.text,
                        isPassword: true,
                        validationText: provider?.messageValidatorPassword,
                        onChanged: (value) {
                          provider?.messageValidatorPassword = Validators.validatorPasswordRegister(pwdController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: buttonCustom(
                          context,
                          Strings.register,
                          Colors.green,
                          _register
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: buttonCustom(
                          context,
                          Strings.logIn,
                          Colors.blueGrey,
                          _login
                      ),
                    ),
                    const SizedBox(height: 50)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(Validators.validatorFormRegister(
        emailController.text,
        pwdController.text,
        nameController.text,
        phoneController.text)) {
      provider?.register(context, emailController.text, pwdController.text, nameController.text, phoneController.text);
    } else {
      routes.openAlert(context, Strings.messageFormEmpty);
    }
  }

  void _login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    provider?.messageValidatorPassword = "";
    Navigator.pop(context);
  }
}