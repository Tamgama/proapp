import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/pages/homepage/HomePage.dart';
import 'package:proapp/pages/videopage/VideoPage.dart';
import 'package:proapp/pages/searchspage/SearchsPage.dart';
import 'package:proapp/pages/savedpage/SavedPage.dart';
import 'package:proapp/pages/profiles/ProfilePage.dart';

class Bottomnavbar extends State<MyHomePage> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
