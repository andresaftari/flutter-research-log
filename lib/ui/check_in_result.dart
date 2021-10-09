import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_magang/controller/main_controller.dart';

class CheckInResult extends StatelessWidget {
  final Controller _controller = Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(177, 17, 22, 5),
                Color.fromRGBO(237, 28, 36, 5),
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Masih dalam pengembangan')),
                );
              },
              splashRadius: 25.0,
              icon: Icon(Icons.close),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Masih dalam pengembangan')),
                  );
                },
                icon: Icon(Icons.history_rounded),
                label: Text('Riwayat'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
}
