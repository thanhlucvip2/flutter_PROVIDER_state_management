import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MySetting(), // khai báo nhà cung cấp store
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

// nhà cung cấp store
class MySetting extends ChangeNotifier {
  String text = 'Dosne';
  Color color = Colors.red;
  void changeText() {
    if (text == 'HELLO') {
      text = 'WORLD';
    } else {
      text = 'HELLO';
    }
    notifyListeners();
  }

  void changeColor() {
    if (color == Colors.red) {
      color = Colors.blue;
    } else {
      color = Colors.red;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(
      builder: (context, mySettingStore, child) {
        return Scaffold(
          drawer: Drawer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        mySettingStore.changeText();
                        Navigator.pop(context);
                      },
                      child: const Text('Change text'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        mySettingStore.changeColor();
                        Navigator.pop(context);
                      },
                      child: const Text('Change color'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text("provider demo"),
            backgroundColor: mySettingStore.color,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mySettingStore.changeText();
                  },
                  child: const Text('Change text'),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      mySettingStore.changeColor();
                    },
                    child: const Text('Change color'),
                  ),
                ),
                Text(
                  mySettingStore.text,
                  style: TextStyle(color: mySettingStore.color),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
