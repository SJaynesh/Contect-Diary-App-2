import 'package:contacts_diary/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  // Model class Object
  ThemeModel themeModel;

  ThemeController({
    required this.themeModel,
  });

  void changeThemeValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    themeModel.isTheme = !themeModel.isTheme;

    await sharedPreferences.setBool('isTheme', themeModel.isTheme);
    /*
    {
      'isTheme' : false
    }
     */

    notifyListeners();
  }
}
