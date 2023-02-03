import 'package:flutter/material.dart';

class HvPressStart with ChangeNotifier {
  bool _hvPressStart = false;

  bool get hvPressStart => _hvPressStart;

  void chg(bool varhvPressStart) {
    _hvPressStart = varhvPressStart;
    notifyListeners();
  }
}
