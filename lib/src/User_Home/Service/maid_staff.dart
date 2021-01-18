import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class MaidDetails extends StatefulWidget {
  @override
  _MaidDetailsState createState() => _MaidDetailsState();
}

class _MaidDetailsState extends State<MaidDetails> {
  String _m1name, _m1number, _m2name, _m2number, _m3name, _m3number;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("maid")
        .child("Maid1_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m1name = snapshot.value;
        print(_m1name);
      });
    });
    dbref
        .child("maid")
        .child("Maid1_Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m1number = snapshot.value;
        print(_m1number);
      });
    });
    dbref
        .child("maid")
        .child("Maid2_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m2name = snapshot.value;
        print(_m2name);
      });
    });
    dbref
        .child("maid")
        .child("Maid2_Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m2number = snapshot.value;
        print(_m2number);
      });
    });
    dbref
        .child("maid")
        .child("Maid3_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m3name = snapshot.value;
        print(_m3name);
      });
    });
    dbref
        .child("maid")
        .child("Maid3_Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _m3number = snapshot.value;
        print(_m3number);
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Maid Details'),
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
                  "Maid1 Name :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m1name,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Contact No :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m1number,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maid2 Name :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m2name,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Contact No :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m2number,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maid3 Name :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m3name,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Contact No :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  _m3number,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 300,
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
