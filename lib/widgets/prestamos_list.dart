import 'package:flutter/material.dart';
import './prestamo_card.dart';
import '../models/conexion.dart';

class PrestamosList extends StatefulWidget {
  PrestamosList(this.totalPrestamos);
  var totalPrestamos;

  @override
  State<PrestamosList> createState() => _PrestamosListState();
}

class _PrestamosListState extends State<PrestamosList> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // if (screenSize.width <= 1040) {
    //   return ListView.builder(
    //     itemBuilder: (context, index) {
    //       return PrestamoCard(
    //         widget.totalPrestamos[index]["nombre"],
    //         widget.totalPrestamos[index]["imagen_perfil"],
    //         widget.totalPrestamos[index]["telefono"],
    //         widget.totalPrestamos[index]["origen"],
    //         widget.totalPrestamos[index]["monto_financiado"],
    //         widget.totalPrestamos[index]["tasa_interes"],
    //         widget.totalPrestamos[index]["total_cuotas"],
    //         widget.totalPrestamos[index]["total_cuotas_restantes"],
    //         widget.totalPrestamos[index]["plazo"],
    //         widget.totalPrestamos[index]["periodo"],
    //         widget.totalPrestamos[index]["estado"],
    //       );
    //     },
    //     itemCount: widget.totalPrestamos.length,
    //   );
    // } else {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width *
              (screenSize.width > 1040
                  ? 0.35
                  : screenSize.width <= 1040 && screenSize.width >= 780
                      ? 0.5
                      : 1),
          childAspectRatio: screenSize.width >= 780
              ? 3 / 2
              : screenSize.width < 780 && screenSize.width >= 540
                  ? 3.05
                  : 2),
      itemCount: widget.totalPrestamos.length,
      itemBuilder: (BuildContext context, index) {
        return PrestamoCard(
          widget.totalPrestamos[index]["nombre"],
          widget.totalPrestamos[index]["imagen_perfil"],
          widget.totalPrestamos[index]["telefono"],
          widget.totalPrestamos[index]["origen"],
          widget.totalPrestamos[index]["monto_financiado"],
          widget.totalPrestamos[index]["tasa_interes"],
          widget.totalPrestamos[index]["total_cuotas"],
          widget.totalPrestamos[index]["total_cuotas_restantes"],
          widget.totalPrestamos[index]["plazo"],
          widget.totalPrestamos[index]["periodo"],
          widget.totalPrestamos[index]["estado"],
        );
      },
    );
  }
}
