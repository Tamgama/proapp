import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:proapp/widgets/drawer.dart';
import 'package:proapp/widgets/layout.dart';
import 'package:proapp/screens/homes_screen/widgets/home.dart';

class BigCard extends StatelessWidget {
  final Home home;

  const BigCard({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    bool isFav = appState.favorites.contains(home);

    return Consumer<MyAppState>(
      builder: (context, appState, _) {
        return ResponsiveLayout(
          mobileBody: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetails(home: home),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      home.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300, // Altura de la imagen en porcentaje
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'Error al cargar la imagen',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0), // Padding en porcentaje
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            home.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18, // Tamaño de texto en porcentaje
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                            ),
                            onPressed: () {
                              appState.toggleFavorite(home);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 4), // Espacio en porcentaje
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                home.price,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10), // Espacio en porcentaje
                              Text(
                                "${home.street}, ${home.city}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 139, 139, 139),
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 160, 160, 160),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Pide cita",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4), // Espacio en porcentaje
                      Text(
                        home.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
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
            body: ListView.builder(
              itemCount: appState.homes.length,
              itemBuilder: (context, index) {
                final home = appState.homes[index];
                bool isFav = appState.favorites.contains(home);
                return Padding(
                  padding: EdgeInsets.all(8.0), // Padding en porcentaje
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 8.0), // Margen vertical en porcentaje
                    padding: EdgeInsets.all(8.0), // Padding en porcentaje
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            home.imagePath,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width *
                                0.3, // Ancho en porcentaje de la pantalla
                            height: MediaQuery.of(context).size.height *
                                0.2, // Altura en porcentaje de la pantalla
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'Error al cargar la imagen',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                            width: 8.0), // Espacio entre imagen y contenido
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.all(8.0), // Padding en porcentaje
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      home.title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            18, // Tamaño de texto en porcentaje
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                      ),
                                      onPressed: () {
                                        appState.toggleFavorite(home);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4), // Espacio en porcentaje
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          home.price,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            width: 10), // Espacio en porcentaje
                                        Text(
                                          "${home.street}, ${home.city}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 139, 139, 139),
                                          ),
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 160, 160, 160),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Pide cita",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4), // Espacio en porcentaje
                                Text(
                                  home.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
            body: ListView.builder(
              itemCount: appState.homes.length,
              itemBuilder: (context, index) {
                final home = appState.homes[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          home.imagePath,
                          fit: BoxFit.cover,
                          width: 20,
                          height: 20,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                'Error al cargar la imagen',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    home.title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 2.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    onPressed: () {
                                      appState.toggleFavorite(home);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        home.price,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 1.5),
                                      Text(
                                        "${home.street}, ${home.city}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 139, 139, 139),
                                        ),
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                          255, 160, 160, 160),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Pide cita",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1),
                              Text(
                                home.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            endDrawer: NavDrawer(),
          ),
        );
      },
    );
  }
}

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
