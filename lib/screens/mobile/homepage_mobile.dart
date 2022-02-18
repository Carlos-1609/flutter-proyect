import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prestamosapp/models/conexion.dart';
import '../prestamos_activos_screen.dart';
import '../solicitudes_screen.dart';
import '../../widgets/UI/bottom_menu.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile(Key? key) : super(key: key);
  static const routeName = '/homepage';
  @override
  _HomePageMobileState createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile>
    with SingleTickerProviderStateMixin {
  var titles = ['Prestamos Activos', 'Solicitudes'];
  final con = Conexion();
  final _nombreCliente = TextEditingController();
  var prestamos = [];
  var filterPrestamos = [];
  String searchCliente = "";
  Timer? _debounce;
  late TabController _tabController;
  var _isLoading = false;

  void getPrestamos() async {
    prestamos = await con.getDataPrestamos();

    setState(() {
      filterPrestamos = prestamos;
      _isLoading = false;
    });
  }

  void _filterClientes() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    } // si hay un timer activo lo cancelamos
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        if (searchCliente != _nombreCliente.text) {
          /* si los dos estan vacios entonces no hay nada en el textbox 
          por ende mostramos todos los clientes*/
          filterPrestamos = prestamos;
        }

        setState(() {
          filterPrestamos = prestamos.where((cliente) {
            final nombreCliente = cliente["nombre"].toLowerCase();
            final input = _nombreCliente.text.toLowerCase();
            return nombreCliente.contains(input);
          }).toList();
        });
        searchCliente = _nombreCliente.text;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    _nombreCliente.addListener(_filterClientes);
    _isLoading = true;
    getPrestamos();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose(); // release the animation controller
    _nombreCliente.removeListener(_filterClientes);
    _nombreCliente.dispose();
    _debounce?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es_ES').then((value) => null);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: ListTile(
          leading: Icon(
            Icons.account_circle_outlined,
            color: Color(0xff1A71F3),
            size: 45,
          ),
          title: Text(
            'Hola, José',
            style: TextStyle(
                color: Color(0xff1A71F3),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            DateFormat.yMMMMEEEEd('es').format(
              DateTime.now(),
            ),
            style: TextStyle(color: Color(0xff1A71F3)),
          ),
          trailing: Icon(
            Icons.link,
            color: Color(0xff1A71F3),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xff1A71F3),
          indicatorColor: Colors.blue[700],
          unselectedLabelColor: Colors.black54,
          tabs: [
            Tab(
              text: 'Préstamos',
            ),
            Tab(
              text: 'Solicitudes',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  titles[_tabController.index],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 350,
                margin: EdgeInsets.only(bottom: 5),
                child: TextField(
                  controller: _nombreCliente,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      hintText: 'Buscar cliente',
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5.5)),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      )),
                ),
              ),
            ]),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : PrestamosActivos(filterPrestamos),
                  Solicitudes(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
