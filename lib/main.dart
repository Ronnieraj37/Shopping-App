import 'package:flutter/material.dart';
import 'package:shopping/pages/login_page.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  //bool theme = false;
  // ThemeMode themeMode = ThemeMode.light;
  // void change(bool value){
  //   setState(() {
  //     if(value==true){
  //       themeMode = ThemeMode.dark;
  //       theme = true;
  //     }
  //     else{
  //       themeMode = ThemeMode.light;
  //       theme = false;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      title: 'Flutter Demo',
      //actions: Widget[Switch(value: dark, onChanged: (value){changeColor(value);})],
      initialRoute: "/login",
      routes: {
        "/" : (context) => const MyApp(),
        "/login" : (context) => const LoginPage(),
      },
    );
  }
}

