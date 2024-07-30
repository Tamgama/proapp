import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color.fromRGBO(131, 48, 54, 0.623),
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
  scaffoldBackgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.white,
    unselectedItemColor: Color.fromARGB(255, 62, 163, 189),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 62, 163, 189),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
);
