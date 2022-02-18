// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'prestamo_progress.dart';

class PrestamoCard extends StatefulWidget {
  PrestamoCard(
      this.nombre,
      this.imagenPerfil,
      this.telefono,
      this.origen,
      this.montoFinanciado,
      this.tasaInteres,
      this.totalCuotas,
      this.totalCuotasRest,
      this.plazo,
      this.periodo,
      this.estado);

  final String nombre;
  final String imagenPerfil;
  final String telefono;
  final String origen;
  final double montoFinanciado;
  final int tasaInteres;
  final int totalCuotas;
  final int totalCuotasRest;
  final String plazo;
  final String periodo;
  final String estado;
  @override
  State<PrestamoCard> createState() => _PrestamoCardState();
}

class _PrestamoCardState extends State<PrestamoCard> {
  final TextStyle subtitleStyles =
      TextStyle(fontSize: 10, color: Colors.grey[700]);

  final TextStyle resStyles = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  final TextStyle infoPerStyles = TextStyle(
    fontSize: 10,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      widget.imagenPerfil,
                    ),
                  ),
                  title: Text(
                    widget.nombre,
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 25, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Teléfono',
                              style: subtitleStyles,
                            ),
                            Text(
                              widget.telefono,
                              style: infoPerStyles,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Origen',
                            style: subtitleStyles,
                          ),
                          Text(
                            widget.origen,
                            style: infoPerStyles,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: PrestamoProgress(widget.estado)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Resumen',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monto Financiado',
                        style: subtitleStyles,
                      ),
                      Text(
                        '${widget.montoFinanciado.toStringAsFixed(2)}',
                        style: resStyles,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tasa de Interés',
                        style: subtitleStyles,
                      ),
                      Text(
                        '${widget.tasaInteres}%',
                        style: resStyles,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cuotas', style: subtitleStyles),
                      Text(
                        '${widget.totalCuotasRest}/${widget.totalCuotas}',
                        style: resStyles,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Plazo', style: subtitleStyles),
                      Text(
                        '${widget.plazo} ${widget.periodo}',
                        style: resStyles,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Estado', style: subtitleStyles),
                      Text(
                        '${widget.estado}',
                        style: resStyles,
                      )
                    ],
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Administrar',
                    style: TextStyle(color: Color(0xff1A71F3), fontSize: 13),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
