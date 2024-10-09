import 'package:contacts_diary/models/counter_model.dart';
import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  // Model class Object
  CounterModel counterModel = CounterModel(
    counter: 0,
  );

  // Todo : Increment
  void increment() {
    counterModel.counter++;
    notifyListeners();
  }

  // Todo : Decrement
  void decrement() {
    if (counterModel.counter > 0) {
      counterModel.counter--;
    }
    notifyListeners();
  }
}
