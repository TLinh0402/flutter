import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskData(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
