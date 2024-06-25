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

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   final List<Widget> _pantallas = [
//     Pantalla1(),
//     Pantalla2(),
//     Pantalla3(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('proapp')),
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _pantallas,
//       ),

//         //
//       ),
//     );
//   }
// }

class Pantalla1 extends StatelessWidget {
  //aquí deberían ir las tarjetas con los favs
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class Pantalla2 extends StatelessWidget {
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

class Pantalla3 extends StatelessWidget {
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
