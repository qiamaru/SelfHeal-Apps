import 'package:flutter/material.dart';

class CurrentPage with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void chg(int varStat) {
    _currentPage = varStat;
    notifyListeners();
  }
}
