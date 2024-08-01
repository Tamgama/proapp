import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktopBody;
    } else if (isTablet(context)) {
      return tabletBody;
    } else {
      return mobileBody;
    }
  }
}
