import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:proapp/screens/feed_screen/widgets/posts.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // construcción del widget
    var appState = context.watch<MyAppState>();
    // obtención del estado de la app con provider
    final homes = appState.homes;

    return ListView.builder(
      // lista de bigcards
      itemCount: homes.length, // nº de elementos de la lista
      itemBuilder: (context, index) {
        final home = homes[index];
        return Padding(
          // estructura de tarjetas dentro de la lista
          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
          child: BigCard(
            // widget personalizado con la info de la tarjeta
            home: home,
          ),
        );
      },
    );
  }
}
