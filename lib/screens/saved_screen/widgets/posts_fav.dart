import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:proapp/screens/homes_screen/widgets/home.dart';
import 'package:provider/provider.dart';

class SavedCard extends StatelessWidget {
  final Home home;

  const SavedCard({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    bool isFav = appState.favorites.contains(home);

    return Container(
      //contenedor de los posts
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // color de fondo del container
        borderRadius:
            BorderRadius.circular(5), // redondea las esquinas del container
        boxShadow: [
          // sombrita de detrás
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
            // 20% de opacidad
            blurRadius: 10,
            // radio de desenfoque de la sombra
            offset: Offset(2, 2),
            // la sombra se desplaza 0 px horizontalmente y 3 verticalmente
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // alineación en e eje horizontal, en el centro
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
                // aplica un radio de borde a esquinas específicas
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: Image.asset(
                home.imagePath,
                fit: BoxFit.cover,
                // cómo se ajusta la imagen al contenedor, con cover, a todo el área del container
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
          ),
          Padding(
            //contenedor de caracteristicas
            padding: const EdgeInsets.all(8.0),
            // añade el pad de 8px a la caja de características
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  home.title,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // alinea al inicio, parte superior
                      children: [
                        Text(
                          home.price,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        // separación entre precio y ubicación
                        Text(
                          home.street,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          home.city,
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
                        SizedBox(width: 10),
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
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CardList extends StatelessWidget {
//   const CardList({Key? key}) : super(key: key); // widgets inmutable, constante

//   @override
//   Widget build(BuildContext context) {
//     // construcción del widget
//     var appState = context.watch<MyAppState>();
//     // obtención del estado de la app con provider
//     final homes = appState.homes;

//     return ListView.builder(
//       // lista de bigcards
//       itemCount: homes.length, // nº de elementos de la lista
//       itemBuilder: (context, index) {
//         final home = homes[index];
//         bool isFav = favoriteImages.contains(imagePath);
//         // Determinación dinámica de isFav

//         return Padding(
//           // estructura de tarjetas dentro de la lista
//           padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
//           child: savedCard(
//             // widget personalizado con la info de la tarjeta
//             home: home,
//           ),
//         );
//       },
//     );
//   }
// }
