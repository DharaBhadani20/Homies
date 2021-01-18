import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class ViewWatchmanDetails extends StatefulWidget {
  @override
  _ViewWatchmanDetailsState createState() => _ViewWatchmanDetailsState();
}

class _ViewWatchmanDetailsState extends State<ViewWatchmanDetails> {
  String _wname, _number;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("watchman")
        .child("Watchman_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _wname = snapshot.value;
        print(_wname);
      });
    });
    dbref
        .child("watchman")
        .child("Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _number = snapshot.value;
        print(_number);
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('WatchMan Details'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "WatchMan Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _wname,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Contact No:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _number,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 400,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.05,
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.grey.withOpacity(0.2),
                    Colors.black.withOpacity(0.1),
                  ],
                  durations: [4000, 5000, 7000],
                  heightPercentages: [0.01, 0.05, 0.03],
                  blur: MaskFilter.blur(BlurStyle.solid, 5),
                ),
                waveAmplitude: 40.00,
                waveFrequency: 3,
                backgroundColor: Colors.grey[100],
                size: Size(double.maxFinite, double.minPositive),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
