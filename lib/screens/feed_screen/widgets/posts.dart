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
        color: Colors.grey[200], // el fondo
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(100),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
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
            padding: const EdgeInsets.all(8.0),
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
                        SizedBox(width: 10), // separación entre widgets
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
                      children: [
                        IconButton(
                          icon: Icon(Icons.calendar_month),
                          onPressed: () {
                            // Acción para el botón de calendario
                          },
                        ),
                        SizedBox(width: 8),
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
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final imagePaths = appState.images.take(10).toList();

    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: BigCard(
            imagePath: imagePaths[index],
            title: 'Casa en el Campo',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus sit amet lectus vitae mollis. Sed venenatis quam ut est elementum, ut condimentum leo aliquam.',
            price: '\$250,000',
            location: 'Ciudad Ejemplo, País',
          ),
        );
      },
    );
  }
}



// class CardList extends StatelessWidget {
//   final List<Map<String, String>> posts = [
//     {
//       "imagePath": "assets/casa1.png",
//       "title": "Casa 1",
//       "description":
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas luctus sit amet lectus vitae mollis. Sed venenatis quam ut est elementum, ut condimentum leo aliquam. ",
//       "price": "250.000 €",
//       "location": "Espinardo"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     final imagePaths = appState.images.take(10).toList();

//     return ListView.builder(
//       itemCount: imagePaths.length,
//       itemBuilder: (context, index) {
//         return CardItem(
//             imagePath: imagePaths[index],
//             title: posts[index]["title"]!,
//             description: posts[index]["description"]!,
//             price: posts[index]["price"]!,
//             location: posts[index]["location"]!);
//       },
//     );
//   }
// }

// class CardItem extends StatelessWidget {
//   const CardItem({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.location,
//   }) : super(key: key);

//   final String imagePath;
//   final String title;
//   final String description;
//   final String price;
//   final String location;

//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var isFav = appState.favorites.contains(imagePath);

//     return Container(
//       // marco-fondo de cada post
//       margin: const EdgeInsets.only(
//           left: 10, right: 10, bottom: 5, top: 5), // márgenes
//       padding: const EdgeInsets.all(10), // separación del contenido
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.inversePrimary, //color marco
//         border: Border.all(color: Color.fromARGB(82, 0, 0, 0)), //borde externo
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Color.fromARGB(82, 0, 0, 0),
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(imagePath, fit: BoxFit.cover),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   FittedBox(
//                     fit: BoxFit.contain,
//                     child: Text(
//                       description,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Padding(
//                     // precio
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(price,
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     // ubicación
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(location,
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.calendar_month),
//                   ),
//                   SizedBox(width: 8),
//                   IconButton(
//                     onPressed: () {
//                       appState.toggleFavorite(imagePath);
//                     },
//                     icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }





// class CardList extends StatelessWidget {
//   const CardList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     final imagePaths = appState.images.take(10).toList();

//     return ListView.builder(
//       itemCount: imagePaths.length,
//       itemBuilder: (context, index) {
//         return CardItem(imagePath: imagePaths[index]);
//       },
//     );
//   }
// }

// class Post extends StatelessWidget {
//   const Post({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     required this price,
//     required this location,
//     required this.description,
//   }) :super(key: key);

//   final String imagePath;
//   final String title;
//   final String price;
//   final String location;
//   final String description;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Color.fromARGB(98, 255, 0, 140),
//       ),
//       child: Center(
//         child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity,
//             errorBuilder: (context, error, stackTrace) {
//           return Center(
//             child: Text(
//               'Error al cargar la imagen',
//               style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

// class CardItem extends StatelessWidget {
//   const CardItem({super.key, required this.imagePath});

//   final String imagePath;

//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var isFav = appState.favorites.contains(imagePath);

//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(255, 255, 242, 215), //color marco
//         // borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//               color: Color.fromARGB(41, 0, 0, 0),
//               blurRadius: 6,
//               offset: Offset(0, 3)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Post(imagePath: imagePath),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.calendar_month),
//                   tooltip: "Cita",
//                 ),
//                 SizedBox(width: 8),
//                 IconButton(
//                   onPressed: () {
//                     appState.toggleFavorite(imagePath);
//                   },
//                   icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
//                   tooltip: "Like",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
