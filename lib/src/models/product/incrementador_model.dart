import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 1;

  CounterModel(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
/*     if (_counter <= 4) {
      _counter++;
    }

    _counter = _counter; */
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    if (_counter <= 1) {
      _counter = 1;
    }
    notifyListeners();
  }
}
