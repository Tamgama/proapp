import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:proapp/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final imagePaths = appState.images.take(10).toList();

    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return CardItem(imagePath: imagePaths[index]);
      },
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var isFav = appState.favorites.contains(imagePath);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 242, 215), //color marco
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCard(
            imagePath: imagePath,
            title: 'Hermosa Casa en el Campo',
            description:
                'Casa de estilo rústico con amplio jardín y vistas espectaculares.',
            price: '\$250,000',
            location: 'Ciudad Ejemplo, País',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                  tooltip: "Cita",
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    appState.toggleFavorite(imagePath);
                  },
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  tooltip: "Like",
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'bold',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' world!'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200], // Color de fondo del contenedor
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'Error al cargar la imagen',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Precio: $price',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Ubicación: $location',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CardList extends StatelessWidget {
//   const CardList({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     final imagePaths = appState.images.take(10).toList();

//     return ListView.builder(
//       itemCount: imagePaths.length,
//       itemBuilder: (context, index) {
//         return Post(
//           imagePath: imagePaths[index],
//           title: 'Casa en el Campo',
//           description:
//               'Casa de estilo rústico con amplio jardín y vistas espectaculares.',
//           price: '\$250,000',
//           location: 'Ciudad Ejemplo, País',
//         );
//       },
//     );
//   }
// }

// class Post extends StatelessWidget {
//   const Post({
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
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.grey[200], // Color de fondo del contenedor
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Stack(
//           children: [
//             Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               errorBuilder: (context, error, stackTrace) {
//                 return Center(
//                   child: Text(
//                     'Error al cargar la imagen',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [
//                       Colors.black.withOpacity(0.8),
//                       Colors.transparent,
//                     ],
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       description,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Precio: $price',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           'Ubicación: $location',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
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
//           RichText(
//             text: TextSpan(
//               text: 'Hello ',
//               style: DefaultTextStyle.of(context).style,
//               children: const <TextSpan>[
//                 TextSpan(
//                     text: 'bold',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 TextSpan(text: ' world!'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
