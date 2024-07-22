import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/widgets/layout.dart';
import 'package:proapp/widgets/drawer.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/profile_screen/profile.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/search_screen/searchs.dart';

void main() {
  // ejecución pa iniciar la app
  runApp(MyApp()); //punto de entrada
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); //constructor

  // colores para diferenciar los fondos de las pantallas
  // solo para localizar, a eliminar
  final List<Color> _colores = [
    Color.fromARGB(255, 206, 149, 149),
    Color.fromARGB(255, 231, 221, 133),
    Color.fromARGB(255, 144, 249, 158),
    Color.fromARGB(255, 123, 200, 219),
    Color.fromARGB(255, 190, 130, 224),
  ];

  @override
  Widget build(BuildContext context) {
    // contructor
    // devuelve un MaterialApp con tema y título definidos
    // y HomePage como página inicial
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: Consumer<MyAppState>(
        // escucha los cambios en Myappstate
        builder: (context, appState, _) {
          return MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: _colores[appState.currentPage],
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Color.fromARGB(255, 52, 94, 27),
              ),
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[
    feedScreen(),
    reelsScreen(),
    searchsScreen(),
    favScreen(),
    profileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppState>(
      builder: (context, appState, _) {
        return ResponsiveLayout(
          mobileBody: Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                onTap: () {
                  appState.setPage(0);
                },
                child: Text("Promurcia"),
              ),
            ),
            body: _widgetOptions.elementAt(appState.currentPage),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: appState.currentPage,
              onTap: (index) {
                appState.setPage(index);
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_arrow), label: 'Reels'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ),
          tabletBody: Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                onTap: () {
                  appState.setPage(0);
                },
                child: const Text("Promurcia"),
              ),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
              ],
            ),
            body: Row(
              children: [
                Expanded(
                  child: _widgetOptions.elementAt(appState.currentPage),
                ),
              ],
            ),
            endDrawer: NavDrawer(),
          ),
          desktopBody: Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                onTap: () {
                  appState.setPage(0);
                },
                child: const Text("Promurcia"),
              ),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
              ],
            ),
            body: Row(
              children: [
                Expanded(
                  child: _widgetOptions.elementAt(appState.currentPage),
                ),
              ],
            ),
            endDrawer: NavDrawer(),
          ),
        );
      },
    );
  }
}

class MyAppState extends ChangeNotifier {
  // subclase
  final List<String> images = [
    "assets/casa1.png",
    "assets/casa2.png",
    "assets/casa3.png",
    "assets/casa4.png",
    "assets/casa5.png",
    "assets/casa6.png",
  ];

  String currentImage;
  int currentPage = 0;

  MyAppState() : currentImage = "assets/casa1.png" {
    getNext();
  }

  void getNext() {
    // selección aleatoria de imágenes
    currentImage = (images..shuffle()).first;
    notifyListeners();
  }

  var favorites = <String>[];

  void toggleFavorite(String imageUrl) {
    // para agregar y quitar favs y notificar los cambios
    if (favorites.contains(imageUrl)) {
      favorites.remove(imageUrl);
    } else {
      favorites.add(imageUrl);
    }
    notifyListeners();
  }

  void setPage(int index) {
    // cambia la página actual y notifica cambios
    currentPage = index;
    notifyListeners();
  }
}
