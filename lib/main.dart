import 'package:flutter/material.dart';
import 'package:flutter_state_management_couter_app/model/counter.dart';
import 'package:flutter_state_management_couter_app/setting.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Counter(), // khai báo nhà cung cấp store
        ),
        ChangeNotifierProvider(
          create: (context) => MySetting(), // khai báo nhà cung cấp store
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// nhà cung cấp store

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'state management',
      theme: ThemeData(
          brightness: context.watch<MySetting>().isDark
              ? Brightness.dark
              : Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("my app par")),
          actions: [
            // icon switch trên menu bar
            Switch(
              value: context.watch<MySetting>().isDark,
              onChanged: (value) {
                context.read<MySetting>().setBrightness(value);
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            context
                .watch<Counter>()
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
            context.read<Counter>().add(); // bắt sự kiện cho provider
          },
        ),
      ),
    );
  }
}
