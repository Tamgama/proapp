import 'package:flutter/material.dart';
import 'package:proapp/pages/homepage/widgets/cardlist.dart';
import 'package:provider/provider.dart';
import 'responsive/layout.dart';
import 'responsive/desktop_body.dart';
import 'responsive/mobile_body.dart';
import 'package:proapp/widgets/bottomnavbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'proApp',
        theme: ThemeData(
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
