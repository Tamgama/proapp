import 'package:flutter/material.dart';

class HomesView extends StatelessWidget {
  const HomesView({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.street,
    required this.city,
    // required this.streetNum,
    // required this.district,
    // required this.door,
    // required this.floor,
    // required this.edif,
    // required this.ref,
    // required this.type,
    // required this.wc,
    // required this.rooms,
    // required this.area,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String description;
  final String price;
  final String street;
  final String city;
  // final String streetNum;
  // final String district;
  // final String door;
  // final String floor;
  // final String edif;
  // final String ref;
  // final String type;
  // final String wc;
  // final String rooms;
  // final String area;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '$street, $city',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar funcionalidad de "Pide cita"
                    },
                    child: Text('Pide cita'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
