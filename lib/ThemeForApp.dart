import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    canvasColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    canvasColor: Colors.black,
  );
}
