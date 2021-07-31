import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => this._isLightTheme;
}
