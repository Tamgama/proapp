import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromRGBO(131, 48, 54, 0.705),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.black,
    unselectedItemColor: Color.fromARGB(255, 117, 28, 28),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(131, 48, 54, 0.623),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromRGBO(130, 48, 53, 0),
  scaffoldBackgroundColor: Color.fromARGB(255, 37, 34, 34),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color.fromARGB(255, 202, 168, 168),
    unselectedItemColor: Color.fromARGB(255, 160, 38, 38),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 117, 28, 28),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle:
        TextStyle(color: Color.fromARGB(255, 240, 172, 163), fontSize: 20),
  ),
);
