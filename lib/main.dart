import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(), // khai báo nhà cung cấp store
      child: const MaterialApp(
        home: HomeScreen(),
      ),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SecondScreen()));
              },
              child: const Text('Go to second Screen'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

//SecondScreen

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go to home Screen'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
