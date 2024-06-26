import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'proApp',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 34, 255, 181)), // color general
        ),
        home: MyHomePage(),
      ),
    );
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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  var _currentPage = 0;
  var _pages = [
    //cambia el contenido de cada página
    HomePage(),
    VideoPage(),
    SearchsPage(),
    SavedPage(),
    UserProfile(),
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
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color.fromARGB(255, 75, 4, 206),
          unselectedItemColor: Color.fromARGB(255, 204, 64, 111),
        ),
      ),
      home: Scaffold(
        backgroundColor: _colores[_color],
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Casas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'Vídeos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lens),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            )
          ],
          currentIndex: _currentPage,
//          fixedColor: Colors.black,
          onTap: (int inIndex) {
            setState(() {
              // las páginas y los colores se unen y muestras por indices
              _currentPage = inIndex;
              _color = inIndex;
            });
          },
          type: BottomNavigationBarType.shifting,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
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

class VideoPage extends StatelessWidget {
  // aquí se guardan los favs
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Elemento $index'),
        );
      },
    );
  }
}

class SearchsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Ítem $index'),
        );
      },
    );
  }
}

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asPascalCase),
          ),
      ],
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Ítem $index'),
        );
      },
    );
  }
}
