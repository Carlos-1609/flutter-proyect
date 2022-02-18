import 'package:flutter/material.dart';
import 'package:prestamosapp/Screens/login_screen.dart';

import '../widgets/UI/text_input.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isChecked = false;

  bool checked() {
    setState(() {
      _isChecked = !_isChecked;
    });
    return _isChecked;
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
              SizedBox(height: 25),
              Text(
                'Crear una cuenta',
                style: TextStyle(
                  color: Color(0xff1A71F3),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              TextInput(hint: 'Nombre', typePass: false),
              SizedBox(height: 25),
              TextInput(hint: 'Teléfono', typePass: false),
              SizedBox(height: 25),
              TextInput(hint: 'Correo electrónico', typePass: false),
              SizedBox(height: 25),
              TextInput(hint: 'Fecha de nacimiento', typePass: false),
              SizedBox(height: 25),
              TextInput(hint: 'Contraseña', typePass: true),
              SizedBox(height: 25),
              TextInput(hint: 'Repetir contraseña', typePass: true),
              SizedBox(height: 25),
              CheckboxListTile(
                contentPadding: EdgeInsets.only(right: 0),
                checkColor: Colors.white,
                activeColor: Color(0xff1A71F3),
                value: _isChecked,
                onChanged: (_isChecked) {
                  checked();
                },
                title: Text(
                  'Acepto los términos y condiciones',
                  style: TextStyle(
                      fontSize: 14, decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Crear Cuenta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff1A71F3),
                    minimumSize: Size(350, 45)),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes una cuenta?',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Login.routeName);
                      },
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
