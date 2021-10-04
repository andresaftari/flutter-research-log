import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'check_in_dialogs.dart';

class CheckInPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {},
            splashRadius: 25.0,
            icon: Icon(Icons.close),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.history_rounded),
              label: Text('Riwayat'),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.transparent,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Check-In Pegawai',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
            _loadUserData(context),
            SizedBox(height: 48.0),
            _loadBottomCard(context),
          ],
        ),
      ),
    );
  }

  _loadUserData(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Untuk Nama Pengguna
                Text(
                  'Prasidya Pramadresana Saftari',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8),

                // Untuk NIP pengguna
                Text(
                  '6706193049',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 8),

                // Untuk Workplace
                Text(
                  'Direktorat Pusat Teknologi Informasi',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // LOAD BOTTOM CARD FEATURES
  _loadBottomCard(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 340,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _loadCurrentLocation(context),
                _setSliderCheckIn(context),
              ],
            ),
          ),
        ),
      );

  // LOAD CURRENT TIME
  Widget _loadCurrentTime() {
    DateTime now = DateTime.now();
    String _hour = '';

    if (now.hour < 10)
      _hour = '0${now.hour}';
    else
      _hour = now.hour.toString();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Waktu Sekarang',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          '$_hour:${now.minute}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // LOAD CURRENT LOCATION
  _loadCurrentLocation(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _loadCurrentTime(),
          SizedBox(height: 16),
          Container(
            color: Color.fromRGBO(226, 226, 226, 800),
            height: 2,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 16),
          Text(
            'Anda sedang berada di',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 30,
                color: Color.fromRGBO(211, 44, 40, 800),
              ),
              SizedBox(width: 8.0),
              Text(
                'Jl. Telekomunikasi No. 1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      );

  // SET CHECK-IN SLIDER
  _setSliderCheckIn(BuildContext context) => Column(
        children: [
          Center(child: Text('Anda Dapat Melakukan Check-In')),
          SizedBox(height: 8.0),
          SlideAction(
            elevation: 0,
            borderRadius: 8,
            height: 60,
            sliderRotate: false,
            text: 'Geser untuk Check-In',
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            sliderButtonIconSize: 18,
            sliderButtonIcon: Icon(
              CupertinoIcons.arrow_right,
              color: Colors.white,
            ),
            submittedIcon: Icon(
              CupertinoIcons.check_mark,
              color: Colors.yellowAccent,
            ),
            outerColor: Color.fromRGBO(248, 63, 69, 1),
            innerColor: Color.fromRGBO(211, 44, 40, 1),
            onSubmit: () {
              scaffoldKey.currentState!.showBottomSheet(
                (context) => CheckInDialog(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                elevation: 2.0
              );
            },
          ),
        ],
      );
}
