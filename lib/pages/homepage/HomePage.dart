import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proapp/responsive/layout.dart';
import 'package:proapp/responsive/mobile_body.dart';
import 'package:proapp/responsive/desktop_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = MediaQuery.of(context).size;
    var deviceOrientation = MediaQuery.of(context).orientation;
    var fontScaling = MediaQuery.of(context).textScaler;
    var notchInset = MediaQuery.of(context).padding;

    // if (screenSize > oneColumnLayout) {
    // } else {
    //   // one column layout
    // }
    // ;

    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileHome(),
        desktopBody: DesktopHome(),
      ),
    );
  }
}
