import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proapp/responsive/layout.dart';
import 'package:proapp/responsive/mobile_body.dart';
import 'package:proapp/responsive/desktop_body.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: _colores[_currentPage],
        //   body: ResponsiveLayout(
        //     mobileBody: MobileVideo(pages: _pages, currentPage: _currentPage),
        //     desktopBody: DesktopVideo(pages: _pages, currentPage: _currentPage),
        //   ),
        );
  }
}
