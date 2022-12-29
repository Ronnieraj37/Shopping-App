import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('data')),
        body: const Center(
          child: Text(
            "Loda ka's App bc",
            style: TextStyle(fontSize: 40),
          ),
        ),
        drawer: const Drawer(child: Text('data')),
      );
  }
}
