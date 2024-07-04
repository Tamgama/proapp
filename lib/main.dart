import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/widgets/bottom_navbar.dart';
import 'package:proapp/pages/homepage/HomePage.dart';
import 'package:proapp/pages/videopage/VideoPage.dart';
import 'package:proapp/pages/searchspage/SearchsPage.dart';
import 'package:proapp/pages/savedpage/SavedPage.dart';
import 'package:proapp/pages/profiles/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var currentpage = 0;

  var pages = [
    HomePage(),
    VideoPage(),
    SearchsPage(),
    SavedPage(),
    UserProfile(),
  ];

  var _colores = [
    Color.fromARGB(255, 206, 149, 149),
    const Color.fromARGB(255, 231, 221, 133),
    const Color.fromARGB(255, 144, 249, 158),
    Color.fromARGB(255, 123, 200, 219),
    Color.fromARGB(255, 190, 130, 224),
  ];

  var color = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'proApp',
        theme: ThemeData(
          scaffoldBackgroundColor: _colores[color],
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color.fromARGB(255, 0, 0, 0),
            unselectedItemColor: Color.fromARGB(255, 52, 94, 27),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// modificaciones de una u otra página que alteran las demás u otras funcionalidades
class MyAppState extends ChangeNotifier {
  final List<String> images = [
    "assets/casa1.png",
    "assets/casa2.png",
    "assets/casa3.png",
    "assets/casa4.png",
    "assets/casa5.png",
    "assets/casa6.png",
    // añade más URLs de imágenes aquí
  ];

  late String currentImage;

  MyAppState() {
    getNext();
  }

  void getNext() {
    currentImage = (images..shuffle()).first;
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(String imageUrl) {
    //si está ya en favs, lo quita, y si no, lo añade
    if (favorites.contains(imageUrl)) {
      favorites.remove(imageUrl);
    } else {
      favorites.add(imageUrl);
    }
    notifyListeners(); //pa q se actualice la interfaz donde se utiliza esta clase
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => Bottomnavbar();
}
