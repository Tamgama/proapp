import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
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
      //contenedor de los posts
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // color de fondo del container
        borderRadius: BorderRadius.only(
          // redondea las esquinas del container
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(50),
        ),
        boxShadow: [
          // sombrita de detrás
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.2), // 20% de opacidad
            blurRadius: 10, // radio de desenfoque de la sombra
            offset: Offset(2,
                2), // la sombra se desplaza 0 px horizontalmente y 3 verticalmente
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .center, // alineación en e eje horizontal, en el centro
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              // aplica un radio de borde a esquinas específicas
              topLeft: Radius.circular(5),
              topRight: Radius.circular(50),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit
                  .cover, // cómo se ajusta la imagen al contenedor, con cover, a todo el área del container
              width: double.infinity, // así ocupa todo el ancho disponible
              height: 200,
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
          Padding(
            //contenedor de caracteristicas
            padding: const EdgeInsets.all(
                8.0), // añade el pad de 8px a la caja de características
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  // container del precio y ubicacion en horizontal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // alinea al inicio, parte superior
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            width: 10), // separación entre precio y ubicación
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // container de los botones
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 160, 160, 160),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Pide cita",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(width: 10), // separación enter los botones
                        IconButton(
                          icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border),
                          onPressed: () {
                            appState.toggleFavorite(imagePath);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  // descripción
                  description,
                  maxLines: 2,
                  overflow: TextOverflow
                      .ellipsis, // si el texto excede el maxLines, se comprime con ...
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
            location: 'Ciudad Ejemplo, País',
          ),
        );
      },
    );
  }
}
