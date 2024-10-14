import 'package:contacts_diary/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends ChangeNotifier {
  // Model class Object
  CounterModel counterModel;

  CounterController({
    required this.counterModel,
  });

  // Todo : Increment
  void increment() async {
    counterModel.counter++;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt('counter', counterModel.counter);

    notifyListeners();
  }

  // Todo : Decrement
  void decrement() async {
    if (counterModel.counter > 0) {
      counterModel.counter--;
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt('counter', counterModel.counter);
    notifyListeners();
  }
}
