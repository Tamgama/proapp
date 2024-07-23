import 'package:flutter/material.dart';
import 'package:proapp/screens/homes_screen/widgets/homes.dart';

class homesScreen extends StatefulWidget {
  const homesScreen({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<homesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HomeDetails(),
      ),
    );
  }
}
