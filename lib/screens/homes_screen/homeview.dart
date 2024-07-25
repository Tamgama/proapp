import 'package:flutter/material.dart';
import 'package:proapp/screens/homes_screen/widgets/home.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';

class HomesScreen extends StatefulWidget {
  const HomesScreen({Key? key}) : super(key: key);

  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView.builder(
      itemCount: appState.homes.length,
      itemBuilder: (context, index) {
        return HomeDetails(home: appState.homes[index]);
      },
    );
  }
}
