import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State {
  var _currentPage = 0;
  var _pages = [
    //cambia el contenido de cada página
    Text("Ver casas"),
    Text("Vídeos 360"),
    Text("Guardados"),
    Text("Búsquedas"),
    Text("Perfil"),
  ];
  var _colores = [
    Color.fromARGB(255, 206, 149, 149),
    const Color.fromARGB(255, 231, 221, 133),
    const Color.fromARGB(255, 144, 249, 158),
    Color.fromARGB(255, 123, 200, 219),
    Color.fromARGB(255, 190, 130, 224)
  ];
  var _color = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "copy 2",
        home: Scaffold(
            backgroundColor: _colores[_color],
            // el color que ya se ha dado arriba, si no, se cambian todos
            body: Center(child: _pages.elementAt(_currentPage)),
            bottomNavigationBar: BottomNavigationBar(
                // crea los botones
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Casas"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.play_arrow), label: "Vídeo 360"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "Guardados"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.lens), label: "Búsquedas"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Perfil"),
                ],
                currentIndex: _currentPage,
                fixedColor:
                    const Color.fromARGB(255, 0, 0, 0), // color de los botones
                onTap: (int inIndex) {
                  setState(() {
                    _currentPage = inIndex;
                    _color = inIndex;
                  });
                })));
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10), // separación caja - botones
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // letras tarjeta
    );

    return Card(
      color: Color.fromARGB(99, 0, 89, 255), // color tarjeta
      child: Padding(
        padding: const EdgeInsets.all(50), // padding tarjeta
        child: Text(
          pair.asPascalCase, // letras tarjeta
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
