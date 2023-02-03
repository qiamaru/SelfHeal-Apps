import 'package:flutter/material.dart';

class isConfirm with ChangeNotifier {
  bool _isconfirm = false;

  bool get isconfirm => _isconfirm;

  void chg(bool varConfirm) {
    _isconfirm = varConfirm;
    notifyListeners();
  }
}
