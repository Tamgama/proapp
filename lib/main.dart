import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proapp/widgets/layout.dart';
import 'package:proapp/widgets/drawer.dart';
import 'package:proapp/widgets/themes.dart';
import 'package:proapp/screens/feed_screen/feed.dart';
import 'package:proapp/screens/profile_screen/profile.dart';
import 'package:proapp/screens/reels_screen/videos.dart';
import 'package:proapp/screens/saved_screen/favorites.dart';
import 'package:proapp/screens/search_screen/searchs.dart';
import 'package:proapp/screens/homes_screen/widgets/home.dart';
import 'package:proapp/screens/registration/registration.dart';

void main() {
  // ejecución pa iniciar la app
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      // escucha los cambios en Myappstate
      child: MyApp(),
    ),
  ); //punto de entrada
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); //constructor

  @override
  Widget build(BuildContext context) {
    // devuelve un MaterialApp con tema y título definidos
    // y HomePage como página inicial
    return Consumer<MyAppState>(
      builder: (context, appState, _) {
        return MaterialApp(
          theme: appState.isDarkMode ? darkTheme : lightTheme,
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static List<Widget> _widgetOptions = <Widget>[
    FeedScreen(),
    ReelsScreen(),
    SearchsScreen(),
    FavScreen(),
    ProfileScreen(),
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
              actions: [
                IconButton(
                  icon: Icon(
                      appState.isDarkMode ? Icons.dark_mode : Icons.light_mode),
                  onPressed: () {
                    appState.toggleTheme();
                  },
                ),
              ],
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
            body: _widgetOptions.elementAt(appState.currentPage),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 139, 139, 139),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 160, 160, 160),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Vídeos 360",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 139, 139, 139),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 160, 160, 160),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Perfil",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(
                      appState.isDarkMode ? Icons.dark_mode : Icons.light_mode),
                  onPressed: () {
                    appState.toggleTheme();
                  },
                ),
                SizedBox(width: 8.0),
              ],
            ),
            body: _widgetOptions.elementAt(appState.currentPage),
          ),
        );
      },
    );
  }
}

class MyAppState extends ChangeNotifier {
  // subclase

  final List<Home> _allHomes = [
    Home(
      imagePaths: [
        "assets/casa1.png",
        "assets/casa2.png",
        "assets/casa3.png",
        "assets/casa4.png",
        "assets/casa5.png",
        "assets/casa6.png"
      ],
      title: "Casa en el Campo",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer semper semper varius. Quisque lobortis odio gravida metus semper, at placerat urna sodales. Duis dapibus risus eget augue malesuada bibendum. Ut posuere nunc et leo egestas, ut accumsan purus iaculis. Morbi cursus sollicitudin tempus. Vestibulum sed sapien laoreet, finibus augue eu, pellentesque augue. Fusce et nibh consequat lectus ultricies rutrum. Maecenas ornare nec dolor at pharetra. Suspendisse imperdiet sit amet eros ac aliquam. Nullam vel dolor ut odio egestas maximus. Quisque efficitur mauris massa, ac pulvinar lectus accumsan non. Nulla faucibus sem quis molestie mollis. In molestie elit quis vehicula interdum. ",
      price: "250,000€",
      street: "Calle Ejemplo",
      city: "Murcia",
      district: "Distrito Ejemplo",
      elevator: "con ascensor",
      floor: 1,
      wc: 2,
      rooms: 4,
      area: "120m²",
    ),
  ];

  final List<Home> favorites = [];
  int currentPage = 0;

  List<Home> _filteredHomes = [];

  List<Home> get homes => _filteredHomes.isEmpty ? _allHomes : _filteredHomes;

  MyAppState() {
    _filteredHomes = _allHomes;
  }

  void filterHomes(String city, String priceRange) {
    List<Home> filtered = _allHomes;
    if (city.isNotEmpty) {
      filtered = filtered.where((home) => home.city == city).toList();
    }
    if (priceRange.isNotEmpty) {
      filtered = filtered.where((home) {
        if (priceRange == '< 100,000€') {
          return int.parse(home.price.replaceAll(RegExp(r'[^0-9]'), '')) <
              100000;
        } else if (priceRange == '100,000€ - 200,000€') {
          int price = int.parse(home.price.replaceAll(RegExp(r'[^0-9]'), ''));
          return price >= 100000 && price <= 200000;
        } else {
          return int.parse(home.price.replaceAll(RegExp(r'[^0-9]'), '')) >
              200000;
        }
      }).toList();
    }
    _filteredHomes = filtered;
    notifyListeners();
  }

  void toggleFavorite(Home home) {
    if (favorites.contains(home)) {
      favorites.remove(home);
    } else {
      favorites.add(home);
    }
    notifyListeners();
  }

  void setPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  bool _isProfileCreated = false;

  bool get isProfileCreated => _isProfileCreated;

  void createProfile() {
    _isProfileCreated = true;
    notifyListeners();
  }

  void navigateToPage(int index) {
    if (!_isProfileCreated && index == 4) {  // Si intentan ir al perfil sin haber creado uno
      currentPage = 5;  // Redirige al formulario de registro
    } else {
      currentPage = index;
    }
    notifyListeners();
  }
}

