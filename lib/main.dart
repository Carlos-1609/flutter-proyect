import 'package:flutter/material.dart';
import 'package:prestamosapp/Screens/login_screen.dart';
import 'package:prestamosapp/screens/homepage_screen.dart';
import 'package:prestamosapp/screens/signup_screen.dart';
import 'package:prestamosapp/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prestamos Activos',
      home: HomePage(null),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        SignUp.routeName: (ctx) => SignUp(),
        HomePage.routeName: (ctx) => HomePage(null),
        Login.routeName: (ctx) => Login(),
      },
    );
  }
}
