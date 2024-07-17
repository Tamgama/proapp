import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/search_screen/searchs.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/profile_screen/profile.dart';
import 'package:proapp/main.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    final List<Widget> pages = [
      feedScreen(),
      reelsScreen(),
      searchsScreen(),
      favScreen(),
      profileScreen(),
    ];

    return Scaffold(
      body: pages[appState.currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: appState.currentPage,
        onTap: (int newIndex) {
          appState.setPage(newIndex);
        },
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
            icon: Icon(Icons.search),
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
      ),
    );
  }
}
