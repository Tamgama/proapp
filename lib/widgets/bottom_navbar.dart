import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/search_screen/searchs.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/profile_screen/profile.dart';

class Bottomnavbar extends State<MyHomePage> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          BottomNavigationBarItem(
            icon: IconButton(onPressed: HomePage(), icon: Icons(Icons.home)),
            label: 'Casas',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: VideoPage.new(), icon: Icon(Icons.play_arrow)),
            label: 'Vídeos',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: SearchsPage.new(), icon: Icon(Icons.lens)),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: SavedPage.new(), icon: Icon(Icons.favorite)),
            label: "Favs",
          ),
          BottomNavigationBarItem(
            icon: IconButton(onPressed: UserProfile.new.(), icon: Icon(Icons.person)),
            label: "Perfil",
          ),
      ),
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
