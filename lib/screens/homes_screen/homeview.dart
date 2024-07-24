import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';

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
        return BigCard(home: appState.homes[index]);
      },
    );
  }
}
