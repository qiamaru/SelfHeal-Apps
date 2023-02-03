import 'package:flutter/material.dart';

class IsNotGreen with ChangeNotifier {
  bool _isnotgreen = true;

  bool get isnotgreen => _isnotgreen;

  void chg(bool varIsnotgreen) {
    _isnotgreen = varIsnotgreen;
    notifyListeners();
  }
}
