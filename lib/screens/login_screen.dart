import 'dart:async';

import 'package:flutter/material.dart';

import 'package:prestamosapp/Screens/homepage_screen.dart';
import 'package:prestamosapp/widgets/UI/text_input.dart';
import '../Screens/signup_screen.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _revelar = true;
  var _isLoading = false;

  void _toggle() {
    setState(() {
      _revelar = !_revelar;
    });
  }

  void onLogin(BuildContext ctx) {
    setState(() {
      _isLoading = true;
    });
    Timer(
      const Duration(milliseconds: 1000),
      () {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushNamed(HomePage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/Logo.png",
                  height: 200,
                ),
                SizedBox(height: 18),
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A71F3),
                      fontSize: 22),
                ),
                SizedBox(height: 18),
                TextInput(hint: 'Usuario', typePass: false),
                SizedBox(height: 22),
                TextInput(hint: 'Contraseña', typePass: true),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Olvidaste tu contraseña?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 17),
                ElevatedButton(
                  onPressed: _isLoading ? null : () => onLogin(context),
                  child: Text(
                    _isLoading ? 'Por Favor Espere' : 'Iniciar Sesión',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff1A71F3),
                      minimumSize: Size(350, 45)),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No tienes una cuenta?'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(SignUp.routeName);
                        },
                        child: Text(
                          '¡Regístrate ahora!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
