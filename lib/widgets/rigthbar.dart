import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/profile_screen/profile.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/search_screen/searchs.dart';

class NavRail extends StatefulWidget {
  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<MyAppState>(context);

    final List<Widget> pages = [
      feedScreen(),
      reelsScreen(),
      searchsScreen(),
      favScreen(),
      profileScreen(),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Casas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.play_arrow),
                      label: Text('Vídeos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.search),
                      label: Text('Búsquedas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favoritos'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text('Perfil'),
                    ),
                  ],
                  selectedIndex: appState.currentPage,
                  onDestinationSelected: (int index) {
                    setState(() {
                      appState.setPage(index);
                    });
                  },
                ),
              ),
              Expanded(
                child: pages[appState.currentPage],
              ),
            ],
          ),
        );
      },
    );
  }
}
