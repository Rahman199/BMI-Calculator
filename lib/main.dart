import 'package:flutter/material.dart'; 
import "home.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white, size: 90),
          primarySwatch: Colors.teal,
          textTheme: const TextTheme(
              headline2: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline1: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline3: TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 248, 248, 248),
                fontWeight: FontWeight.w900,
              )),
        ),
        home: MyHomePage());
  }
}
