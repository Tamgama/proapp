import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';

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
    var fontScaling = MediaQuery.of(context)
        .textScaler; // textScaler doesn't exist in MediaQuery, should be textScaleFactor
    var notchInset = MediaQuery.of(context).padding;

    // Example layout logic based on screen size
    bool isLargeScreen = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: isLargeScreen
            ? Row(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.blue, child: Text('Left Pane'))),
                  Expanded(
                      child: Container(
                          color: Colors.green, child: Text('Right Pane'))),
                ],
              )
            : Column(
                children: [
                  Container(
                      color: Colors.blue, child: Text('Single Column Layout')),
                ],
              ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
