import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);
    bool isDarkMode = appState.isDarkMode;

    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            trailing:
                Icon(appState.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onTap: () {
              appState.toggleTheme();
              Navigator.pop(context);
            },
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
