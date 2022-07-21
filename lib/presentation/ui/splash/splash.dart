import 'package:animate_do/animate_do.dart';
import 'package:app_restaurant_flutter/core/utils/preferences.dart';
import 'package:app_restaurant_flutter/core/utils/routes.dart';
import 'package:app_restaurant_flutter/core/utils/strings.dart';
import 'package:app_restaurant_flutter/presentation/widgets/text_label_custom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({Key? key}) : super(key: key);
  @override
  Splash createState()=> Splash();
}

class Splash extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _controllerAnimation;
  final prefs = Preferences();

  @override
  void initState() {
    _controllerAnimation = AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    _controllerAnimation.value=0;
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Lottie.asset(
                      'assets/anim/loading_splash.json',
                      width: 200, height: 200,
                      controller: _controllerAnimation,
                      fit: BoxFit.contain,
                      repeat: true,
                      onLoaded: (composition) async{
                        _controllerAnimation.duration = composition.duration;
                      },
                    ),
                  ),
                  FadeIn(
                    delay: const Duration(milliseconds: 1950),
                    duration: const Duration(milliseconds: 750),
                    child: textLabelCustom(
                        Strings.nameApp,
                        TextAlign.center,
                        Colors.deepPurple,
                        22,
                        FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initAnimation() async{
    _controllerAnimation.duration = const Duration(milliseconds: 3000);
    _controllerAnimation.repeat();
    await Future.delayed(const Duration(milliseconds: 3500),(){
      if(prefs.user!="0") {
        routes.openHomeScreen(context);
      } else {
        routes.openLoginScreen(context);
      }
    });
  }
}