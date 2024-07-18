import 'package:flutter/material.dart';

class homes extends StatelessWidget {
  const homes({
    Key? key,
    this.imagePath = "",
    this.title = "",
    this.description = "",
    this.price = "",
    this.street = "",
    this.city = "",
    this.streetNum = "",
    this.district = "",
    this.door = "",
    this.floor = "",
    this.edif = "",
    this.ref = "",
    this.type = "",
    this.wc = "",
    this.rooms = "",
    this.area = "",
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String description;
  final String price;
  final String street;
  final String city;
  final String streetNum;
  final String district;
  final String door;
  final String floor;
  final String edif;
  final String ref;
  final String type;
  final String wc;
  final String rooms;
  final String area;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // youtube video
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.deepPurple[400],
                ),
              ),
            ),

            // comment section & recommended videos
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepPurple[300],
                      height: 120,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     '$street, $city',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Color.fromARGB(255, 32, 27, 107),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     price,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 16, 77, 18),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     description,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Implementar funcionalidad de "Pide cita"
//                     },
//                     child: Text('Pide cita'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
