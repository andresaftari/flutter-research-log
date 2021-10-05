import 'dart:ui';

import 'package:flutter/material.dart';

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
              _setDialogCloseButton(context),
            ],
          ),
        ),
      );

  _setDialogCloseButton(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                primary: Color.fromRGBO(211, 44, 40, 1),
              ),
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ),
      );

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
