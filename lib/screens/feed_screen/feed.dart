import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';
import 'package:proapp/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardList(),
      ),
    );
  }
}
