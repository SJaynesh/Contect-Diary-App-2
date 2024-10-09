import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.white,
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        letterSpacing: 0.6,
      ),
    ),
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: Colors.black,
    //   onPrimary: Colors.white,
    //   secondary: Colors.amber,
    //   onSecondary: Colors.black,
    //   error: Colors.red,
    //   onError: Colors.pink,
    //   surface: Colors.white,
    //   onSurface: Colors.blue,
    // ),
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.brown,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 16.sp,
        color: Colors.green,
        fontWeight: FontWeight.w200,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sp,
        color: Colors.blue,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 25.sp,
        color: Colors.brown,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: const TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.w900,
      ),
    ),
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: Colors.black,
    //   onPrimary: Colors.white,
    //   secondary: Colors.amber,
    //   onSecondary: Colors.black,
    //   error: Colors.red,
    //   onError: Colors.pink,
    //   surface: Colors.white,
    //   onSurface: Colors.blue,
    // ),
  );
}
