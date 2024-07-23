import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({
    Key? key,
    this.imagePath = "",
    this.title = "",
    this.description = "",
    this.price = "",
    this.street = "",
    this.city = "",
    this.elevator = "",
    this.district = "",
    this.floor = "",
    this.ref = "",
    this.wc = "",
    this.rooms = "",
    this.area = "",
  }) : super(key: key);

  final String imagePath;
  final String title; //
  final String description; //
  final String price; //
  final String street; //
  final String city; //
  final String district; //
  final String elevator; //
  final String floor; //
  final String ref; //
  final String wc; //
  final String rooms; //
  final String area; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, StackTrace) {
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
                children: [
                  Text(
                    "$title en $street",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$district, $city",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$floor ª planta $elevator ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$rooms habitaciones y $wc baños",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    ref,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vehicula ipsum nisi, eu elementum velit placerat ac. Fusce diam ligula, accumsan nec mattis quis, posuere eget ipsum. Praesent sodales scelerisque elit eu elementum. Sed erat dui, eleifend ut sollicitudin a, fringilla et dui. Suspendisse vitae viverra ipsum, et dignissim tellus. Vivamus tincidunt congue sagittis. Maecenas ut turpis non urna rhoncus cursus. Aenean lobortis a nisi ac molestie. Phasellus at tellus vel ligula semper cursus sed sit amet risus. Donec viverra sem sit amet elit maximus, non sodales augue convallis."
