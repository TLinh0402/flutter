import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('I am poor', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF015659),
            centerTitle: true,
          ),
          backgroundColor: Color(0xFF06B5D2),
          body: Center(
            child: Image.network(
              "https://free.vector6.com/wp-content/uploads/2021/05/PNG-0000002261-png-soi-da.png",
              width: 200,
            ),
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
        ),
      ),
    );
  }
}
