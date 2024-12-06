import 'package:flutter/material.dart';

class ScreenState extends ChangeNotifier {
  int _screenCount = 0;

  int get screenCount => _screenCount;

  void setScreenCount(int count) {
    _screenCount = count;
    notifyListeners();  // Memberitahu widget untuk memperbarui state
  }
}
