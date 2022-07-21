import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/routes.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/core/utils/validators.dart';
import 'package:app_restaurant_flutter/presentation/provider/user/user_provider.dart';
import 'package:app_restaurant_flutter/presentation/widgets/button_custom.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_input_custom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);
  @override
  Login createState()=> Login();
}

class Login extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController? _controllerAnimation;
  UserProvider? provider;
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    provider = Provider.of<UserProvider>(context,listen: false);
    _controllerAnimation = AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    _controllerAnimation?.value=0;
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation?.dispose();
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UserProvider>(this.context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      child: Lottie.asset(
                        'assets/anim/animation_login.json',
                        width: 250, height: 250,
                        controller: _controllerAnimation,
                        fit: BoxFit.contain,
                        repeat: true,
                        onLoaded: (composition) async{
                          _controllerAnimation?.duration = composition.duration;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
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
                          provider?.messageValidatorPassword = Validators.validatorPassword(pwdController.text);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    FadeIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: buttonCustom(
                          context,
                          Strings.logIn,
                          Colors.green,
                          _login
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 500),
                      child: buttonCustom(
                          context,
                          Strings.singUp,
                          Colors.blueGrey,
                          _register
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

  void _initAnimation() async {
    _controllerAnimation?.duration = const Duration(milliseconds: 3000);
    _controllerAnimation?.repeat();
  }

  void _login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if(Validators.validatorEmail(emailController.text).isEmpty &&
    Validators.validatorPassword(pwdController.text).isEmpty) {
      provider?.login(context, emailController.text, pwdController.text);
    } else {
      routes.openAlert(context, Strings.messageFormEmpty);
    }
  }

  void _register() async {
    provider?.clearValidator();
    routes.openRegisterScreen(context);
  }
}