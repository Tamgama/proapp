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
    final appState = context.watch<MyAppState>();
    final isFav = appState.favorites.contains(home);

    return ResponsiveLayout(
      mobileBody: _buildMobileBody(context, appState, isFav),
      tabletBody: _buildTabletBody(context, appState, isFav),
      desktopBody: _buildDesktopBody(context, appState, isFav),
    );
  }

  Widget _buildMobileBody(
      BuildContext context, MyAppState appState, bool isFav) {
    return Container(
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
                height: 300,
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
            padding: EdgeInsets.all(8.0),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon:
                          Icon(isFav ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        appState.toggleFavorite(home);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 4),
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
                        SizedBox(width: 10),
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
                SizedBox(height: 4),
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
    );
  }

  Widget _buildTabletBody(
      BuildContext context, MyAppState appState, bool isFav) {
    return Scaffold(
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
          final isFav = appState.favorites.contains(home);
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(8.0),
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
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.2,
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
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border),
                                onPressed: () {
                                  appState.toggleFavorite(home);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
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
                                  SizedBox(width: 10),
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
                          SizedBox(height: 4),
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
    );
  }

  Widget _buildDesktopBody(
      BuildContext context, MyAppState appState, bool isFav) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  home.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
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
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    home.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${home.street}, ${home.city}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    home.price,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    home.description,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      IconButton(
                        icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border),
                        onPressed: () {
                          appState.toggleFavorite(home);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavDrawer(),
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
