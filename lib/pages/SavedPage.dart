import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proapp/responsive/layout.dart';
import 'package:proapp/responsive/mobile_body.dart';
import 'package:proapp/responsive/desktop_body.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No hay favoritos"),
      );
    }
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var imageUrl in appState.favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
