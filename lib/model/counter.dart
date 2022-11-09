import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _counter = 0; // khởi tạo state
  int get counter => _counter;
  void add() {
    _counter++;
    notifyListeners(); // thông bao sự thay đổi của provider ( chổ nào cần thay đổi data thì thêm hàm này vào)
  }
}
