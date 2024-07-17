import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/profile_screen/profile.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/search_screen/searchs.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              appState.setPage(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text('Reels'),
            onTap: () {
              appState.setPage(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              appState.setPage(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () {
              appState.setPage(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              appState.setPage(4);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
