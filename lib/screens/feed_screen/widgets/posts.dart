import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/homes_screen/homeview.dart';
import 'package:provider/provider.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String description;
  final String price;
  final String location;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    bool isFav = appState.favorites.contains(imagePath);

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
                  builder: (context) => homesScreen(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(40),
              ),
              child: Image.asset(
                imagePath,
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                      ),
                      onPressed: () {
                        appState.toggleFavorite(imagePath);
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
                          price,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          location,
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
                  description,
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
}

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key); // widgets inmutable, constante

  @override
  Widget build(BuildContext context) {
    // construcción del widget
    var appState = context
        .watch<MyAppState>(); // obtención del estado de la app con provider
    final imagePaths = appState.images.take(10).toList();

    return ListView.builder(
      // lista de bigcards
      itemCount: imagePaths.length, // nº de elementos de la lista
      itemBuilder: (context, index) {
        return Padding(
          // estructura de tarjetas dentro de la lista
          padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
          child: BigCard(
            // widget personalizado con la info de la tarjeta
            imagePath: imagePaths[index],
            title: 'Casa en el Campo',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus sit amet lectus vitae mollis. Sed venenatis quam ut est elementum, ut condimentum leo aliquam.',
            price: '250,000€',
            location: 'Calle Ejemplo, Murcia',
          ),
        );
      },
    );
  }
}
