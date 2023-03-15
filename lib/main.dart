import 'package:flutter/material.dart';
import 'package:shopping/pages/cart_page.dart';
import 'package:shopping/pages/login_page.dart';
import 'package:shopping/widgets/themes.dart';
import 'pages/homepage.dart';
import 'util/my_routes.dart';

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

  var dummy = IdPass('null', 'null');
  void change(String id , String pass){
    dummy.id = id;
    dummy.password = pass;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      //darkTheme: ThemeData(brightness: Brightness.dark),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      title: 'Flutter Demo',
      //actions: Widget[Switch(value: dark, onChanged: (value){changeColor(value);})],
      initialRoute: "/" ,
      routes: {
        "/" : (context) =>  MyApp(dummy.id),
        "/home": (context) => MyApp(dummy.id),
        "/login" : (context) => LoginPage(change),
        "cart" : (context) => CartPage(),
      },
    );
  }
}

