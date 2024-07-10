import 'package:flutter/material.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Color> _colores = [
    Color.fromARGB(255, 206, 149, 149),
    const Color.fromARGB(255, 231, 221, 133),
    const Color.fromARGB(255, 144, 249, 158),
    Color.fromARGB(255, 123, 200, 219),
    Color.fromARGB(255, 190, 130, 224),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: Consumer<MyAppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'proApp',
            theme: ThemeData(
              scaffoldBackgroundColor: _colores[appState.currentPage],
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Color.fromARGB(255, 52, 94, 27),
              ),
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final List<String> images = [
    "assets/casa1.png",
    "assets/casa2.png",
    "assets/casa3.png",
    "assets/casa4.png",
    "assets/casa5.png",
    "assets/casa6.png",
  ];

  String currentImage;
  int currentPage = 0;

  MyAppState() : currentImage = "assets/casa1.png" {
    getNext();
  }

  void getNext() {
    currentImage = (images..shuffle()).first;
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(String imageUrl) {
    if (favorites.contains(imageUrl)) {
      favorites.remove(imageUrl);
    } else {
      favorites.add(imageUrl);
    }
    notifyListeners();
  }

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
