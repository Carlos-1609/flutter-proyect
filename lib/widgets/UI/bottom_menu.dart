import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      elevation: 30,
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xff1A71F3),
      selectedItemColor: Color(0xff1A71F3),
      currentIndex: _selectedIndex,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.stop),
          label: 'Feature',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stop),
          label: 'Feature',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stop),
          label: 'Feature',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Cuenta',
        ),
      ],
    );
  }
}
