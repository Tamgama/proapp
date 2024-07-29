import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/widgets/layout.dart';
import 'package:provider/provider.dart';

class HomeDetails extends StatelessWidget {
  final Home home;

  const HomeDetails({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppState>(builder: (context, appState, _) {
      return ResponsiveLayout(
        mobileBody: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.deepPurple[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                height: 400,
                color: Colors.deepPurple[400],
                child: Image.asset(
                  home.imagePaths.first,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Text(
                      "Error al cargar la imagen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ));
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: _buildDetails(home),
                  ),
                ),
              )
            ],
          ),
        ),
        tabletBody: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.deepPurple[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              Container(
                height: 400,
                color: Colors.deepPurple[400],
                child: Image.asset(
                  home.imagePaths.first,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Text(
                      "Error al cargar la imagen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ));
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: _buildDetails(home),
                  ),
                ),
              )
            ],
          ),
        ),
        desktopBody: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.deepPurple[200],
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1.5, // Adjust this as needed
                          ),
                          itemCount: 6, // Number of images to display
                          itemBuilder: (context, index) {
                            return Image.asset(
                              home.imagePaths[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Text(
                                    "Error al cargar la imagen",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: _buildDetails(home),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _buildDetails(Home home) {
    return [
      Text(
        "${home.title} en ${home.street}",
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        "${home.district}, ${home.city}",
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        home.price,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        home.description,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 8),
      Text(
        "${home.floor} ª planta ${home.elevator} ",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 8),
      Text(
        "${home.rooms} habitaciones y ${home.wc} baños",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              // Acción para el primer botón
            },
            child: Text('Contactar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Acción para el segundo botón
            },
            child: Text('Ver en Mapa'),
          ),
        ],
      ),
    ];
  }
}

class Home {
  final List<String> imagePaths;
  final String title;
  final String price;
  final String street;
  final String city;
  final String description;
  final String district;
  final String elevator;
  final int floor;
  final int wc;
  final int rooms;
  final String area;

  Home({
    required this.imagePaths,
    required this.title,
    required this.price,
    required this.street,
    required this.city,
    required this.description,
    required this.district,
    required this.elevator,
    required this.floor,
    required this.wc,
    required this.rooms,
    required this.area,
  });
}
