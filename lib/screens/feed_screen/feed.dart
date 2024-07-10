import 'package:flutter/material.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';

class feedScreen extends StatefulWidget {
  const feedScreen({Key? key}) : super(key: key);

  @override
  _feedState createState() => _feedState();
}

class _feedState extends State<feedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CardList(),
      ),
    );
  }
}
