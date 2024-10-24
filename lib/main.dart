import 'package:flutter/material.dart';
import 'package:studi_kasus_kuliner/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner Nusantara',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
