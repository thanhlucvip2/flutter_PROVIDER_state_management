import 'package:flutter/cupertino.dart';

class MySetting extends ChangeNotifier {
  bool _isDark = false;
  get isDark => _isDark;

  setBrightness(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
