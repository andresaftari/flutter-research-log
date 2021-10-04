import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_magang/ui/check_in_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'poppins'),
      title: 'Demo GetX',
      home: CheckInPage(),
    );
  }
}
