import 'package:flutter/material.dart';
import '../Widgets/prestamos_list.dart';

class PrestamosActivos extends StatefulWidget {
  PrestamosActivos(this.totalPrestamos);
  var totalPrestamos;
  @override
  _PrestamosActivosState createState() => _PrestamosActivosState();
}

class _PrestamosActivosState extends State<PrestamosActivos> {
  @override
  Widget build(BuildContext context) {
    //return PrestamosList();
    return widget.totalPrestamos.length == 0
        ? Center(
            child: Text(
            'No hay prestamos activos',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ))
        : PrestamosList(widget.totalPrestamos);
  }
}
