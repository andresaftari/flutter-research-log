import 'package:flutter/material.dart';
import 'package:task_magang/screen/home_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GetX',
      home: HomeScreen(),
    );
  }
}
