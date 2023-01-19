import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Home Page/Home Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: DateTime.now().hour>6 && DateTime.now().hour<19
            ?Colors.deepPurple
            :Colors.blueGrey
      ),
      home:  HomePage(),
    );
  }
}


