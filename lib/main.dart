import 'package:app_people/image_screen.dart';
import 'package:app_people/login_screen.dart';
import 'package:app_people/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String route = '/myApp';

  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App People',
      home: SplashScreen(
        seconds: 1,
        navigateAfterSeconds: LoginScreen(),
        image: Image.asset(
          'assets/apppeople.png',
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
      ),
      routes: routes,

    );
  }
}

final routes = <String, Widget Function(BuildContext)>{
  MainScreen.route: (_) => MainScreen(),
  ImageScreen.route: (_) => ImageScreen(),
  LoginScreen.route: (_) => LoginScreen(),
  MyApp.route: (_) => MyApp(),
};
