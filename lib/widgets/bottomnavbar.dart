import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/pages/homepage/HomePage.dart';
import 'package:proapp/pages/videopage/VideoPage.dart';
import 'package:proapp/pages/searchspage/SearchsPage.dart';
import 'package:proapp/pages/savedpage/SavedPage.dart';
import 'package:proapp/pages/profiles/ProfilePage.dart';

class Bottomnavbar extends State<MyHomePage> {
  var _currentPage = 0;
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

  // var _color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colores[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Casas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Vídeos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lens),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _currentPage,
        onTap: (int inIndex) {
          setState(() {
            _currentPage = inIndex;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
