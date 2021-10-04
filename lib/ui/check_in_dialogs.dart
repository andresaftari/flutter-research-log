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
          ),
        ),
      );
}
