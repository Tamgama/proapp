import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:proapp/screens/saved_screen/widgets/posts_fav.dart';

class favScreen extends StatelessWidget {
  const favScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text("No hay favoritos"),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        String imagePath = appState.favorites[index];

        return Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
          child: savedCard(
            imagePath: imagePath,
            title:
                'Casa en el Campo', // Puedes ajustar estos valores según tu necesidad
            price:
                '250,000€', // Puedes ajustar estos valores según tu necesidad
            street: 'Calle Ejemplo',
            city: 'Murcia', // Puedes ajustar estos valores según tu necesidad
            isFav: true,
          ),
        );
      },
    );
  }
}
