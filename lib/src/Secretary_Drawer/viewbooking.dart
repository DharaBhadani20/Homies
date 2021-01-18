import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class BookingDetails extends StatefulWidget {
  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  String _bdate, _btime, _bname, _bnumber, _occasion;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("Booking")
        .child("Owner_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _bname = snapshot.value;
        print(_bname);
      });
    });
 dbref
        .child("Booking")
        .child("Owner_Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _bnumber = snapshot.value;
        print(_bnumber);
      });
    });
    dbref
        .child("Booking")
        .child("Booking_date")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _bdate = snapshot.value;
        print(_bdate);
      });
    });
    dbref
        .child("Booking")
        .child("Booking_time")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _btime = snapshot.value;
        print(_btime);
      });
    });
    dbref
        .child("Booking")
        .child("Occasion")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _occasion = snapshot.value;
        print(_occasion);
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Booking Details'),
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
                  "Name :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(width:5),
                Text(
                  _bname,
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
                  "Contact No :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ), SizedBox(width:5),
                Text(
                  _bnumber,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ), SizedBox(width:5),
                Text(
                  _bdate,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ), SizedBox(width:5),
                Text(
                  _btime,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Occasion :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ), SizedBox(width:5),
                Text(
                  _occasion,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 300),
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
