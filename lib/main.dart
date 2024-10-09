import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_app.dart';

bool? isTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  isTheme = sharedPreferences.getBool('isTheme') ?? true;
  runApp(
    const MyApp(),
  );
}
