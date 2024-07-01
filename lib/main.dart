import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:proapp/widgets/CardList.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        // theme: ThemeData(
        //   useMaterial3: true,
        //   colorScheme: ColorScheme.fromSeed(
        //       seedColor: Color.fromARGB(255, 34, 255, 181)), // color general
        // ),
        home: MyHomePage(),
      ),
    );
  }
}

// modificaciones de una u otra página que alteran las demás u otras funcionalidades
class MyAppState extends ChangeNotifier {
  final List<String> images = [
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1517487881594-2787fef5ebf7',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
    'https://images.unsplash.com/photo-1554135814-6e739b2bd386',
    // añade más URLs de imágenes aquí
  ];

  late String currentImage;

  MyAppState() {
    getNext();
  }

  void getNext() {
    currentImage = (images..shuffle()).first;
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(String imageUrl) {
    if (favorites.contains(imageUrl)) {
      favorites.remove(imageUrl);
    } else {
      favorites.add(imageUrl);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentPage = 0;
  var _pages = [
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
    Color.fromARGB(255, 190, 130, 224),
  ];

  var _color = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          // el botón seleccionado
          unselectedItemColor: Color.fromARGB(255, 52, 94, 27),
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
              // las páginas y los colores se unen y muestran por indices
              _currentPage = inIndex;
              _color = inIndex;
            });
          },
          type: BottomNavigationBarType.shifting,
          // animación
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CardList(),
    );
  }
}

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Ítem $index'),
          );
        },
      ),
    );
  }
}

class SearchsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Ítem $index'),
          );
        },
      ),
    );
  }
}

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

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Ítem $index'),
          );
        },
      ),
    );
  }
}
