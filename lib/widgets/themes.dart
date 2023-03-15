import 'package:flutter/material.dart';

class Themes{
  static ThemeData get lightTheme =>
  ThemeData(
  primarySwatch: Colors.deepPurple,
  appBarTheme: const AppBarTheme(
  color: Colors.white,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black,size: 28 ),
  titleTextStyle: TextStyle(color: Colors.black,fontSize: 24),
  ),
  );

  static ThemeData get darkTheme =>
      ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black,size: 28 ),
          titleTextStyle: TextStyle(color: Colors.black,fontSize: 24),
        ),
      );
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluish = const Color(0xff40385b);

}