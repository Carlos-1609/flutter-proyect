import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key, required this.hint, required this.typePass})
      : super(key: key);
  final String hint;
  final bool typePass;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  var _revelar = true;
  void _toggle() {
    setState(() {
      _revelar = !_revelar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.typePass
        ? TextField(
            obscureText: _revelar,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye_rounded),
                onPressed: _toggle,
              ),
              constraints: BoxConstraints(minWidth: 200),
            ),
          )
        : TextField(
            decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: Icon(Icons.cancel),
            constraints: BoxConstraints(minWidth: 200),
          ));
  }
}
