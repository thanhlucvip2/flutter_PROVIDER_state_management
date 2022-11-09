import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(), // khai báo nhà cung cấp store
      child: const MyApp(),
    ),
  );
}

// nhà cung cấp store
class CounterProvider extends ChangeNotifier {
  int _counter = 10; // khởi tạo state
  int get counter => _counter;
  void add() {
    _counter++;
    notifyListeners(); // thông bao sự thay đổi của provider ( chổ nào cần thay đổi data thì thêm hàm này vào)
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'state management',
      home: Scaffold(
        body: Center(
          child: Text(
            context
                .watch<CounterProvider>()
                .counter
                .toString(), // theo dõi sự kiện và render từ provider
            style: const TextStyle(
              fontSize: 50,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.read<CounterProvider>().add(); // bắt sự kiện cho provider
          },
        ),
      ),
    );
  }
}
