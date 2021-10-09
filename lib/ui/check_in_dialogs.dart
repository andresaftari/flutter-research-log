import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_magang/controller/main_controller.dart';

import 'check_in_result.dart';

class CheckInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1.5,
          sigmaY: 1.5,
        ),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _setDialogText(),
              _setDialogCloseButton(context, "Open"),
            ],
          ),
        ),
      );

  _setDialogCloseButton(BuildContext context, String state) {
    final Controller _controller = Get.put(Controller());

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              state = _controller.submitted.toString();

              try {
                if (state == 'Submitted')
                  Get.to(() => CheckInResult());
                else
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Terjadi kesalahan, silakan buka kembali aplikasi'),
                    ),
                  );
              } catch (ex) {
                print(ex);
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              primary: Color.fromRGBO(211, 44, 40, 1),
            ),
            child: Text(
              'Tutup',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  _setDialogText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat menikmati Hari Cuti!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Terima kasih telah melakukan check-in. Selamat menikmati hari Cuti.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      );
}
