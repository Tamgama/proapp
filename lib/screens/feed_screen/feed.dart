import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';
import 'package:proapp/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
                    child: CardList(),
                  ),
                ],
              )
            : CardList(),
      ),
    );
  }
}
