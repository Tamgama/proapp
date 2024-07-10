import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';

class favScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // contructor del widget
    var appState = context.watch<MyAppState>();
    //actualización del widgets según Myappstate, esperando a que pase algo

    if (appState.favorites.isEmpty) {
      // verificación de lista vacía
      return Center(
        child: Text("No hay favoritos"),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        String imageUrl = appState.favorites[index];

        return ListTile(
          title: Image.asset(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.black,
            onPressed: () {
              appState.toggleFavorite(imageUrl); // Elimina de favoritos
            },
          ),
        );
      },
    );
  }
}
