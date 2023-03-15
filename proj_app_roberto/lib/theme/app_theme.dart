import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 170, 170, 170);
  static const Color iconsColor = Color.fromARGB(255, 170, 170, 170);

  static final mainTheme = ThemeData.light().copyWith(

      //AppBarTheme
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: primary, elevation: 0, foregroundColor: Colors.white),          

      //ListTile
      listTileTheme: const ListTileThemeData(
        iconColor: iconsColor,
      ),

      
      //Icons
      iconTheme: const IconThemeData(
        color: iconsColor,
        size: 30,
      ),
  );
}