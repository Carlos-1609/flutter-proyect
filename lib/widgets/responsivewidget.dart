import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  ResponsiveWidget(this.mobileTab, this.desktop);

  final Widget mobileTab;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 1366) {
        return mobileTab;
      } else {
        return desktop;
      }
    });
  }
}
