import 'package:app_restaurant_flutter/core/utils/preferences.dart';
import 'package:app_restaurant_flutter/presentation/provider/history/history_provider.dart';
import 'package:app_restaurant_flutter/presentation/provider/home/home_provider.dart';
import 'package:app_restaurant_flutter/presentation/provider/user/user_provider.dart';
import 'package:app_restaurant_flutter/presentation/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  StateMyApp createState() => StateMyApp();
}

class StateMyApp extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black87,
        statusBarIconBrightness: Brightness.light
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }

}