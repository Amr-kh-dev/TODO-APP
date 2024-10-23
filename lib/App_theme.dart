import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = Color(0xFF509CEC);
  static Color backgroundLight = Color(0xFFDFECDB);
  static Color backgroundDark = Color(0xFF060E1E);
  static Color black = Color(0xFF363636);
  static Color white = Color(0xFFFFFFFF);
  static Color grey = Color.fromARGB(0, 44, 44, 48);
  static Color grren = Color(0xFF61E757);
  static Color red = Color(0xFFEC4B4B);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryLight,
      scaffoldBackgroundColor: white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundLight,
        selectedItemColor: primaryLight,
        unselectedItemColor: white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryLight,
        foregroundColor: white,
        shape: CircleBorder(side: BorderSide(width: 4, color: white)),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 20, color: black, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontSize: 14, color: black, fontWeight: FontWeight.w400)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: primaryLight,
      )));
  ///////////////////////////////////////////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData();
}
