import 'package:flutter/material.dart';
import 'package:prestamosapp/screens/mobile/homepage_mobile.dart';
import 'package:prestamosapp/screens/web/homepage_web.dart';
import '../widgets/responsivewidget.dart';

class HomePage extends StatefulWidget {
  const HomePage(Key? key) : super(key: key);
  static const routeName = '/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      HomePageMobile(null),
      HomePageWeb(),
    );
  }
}
