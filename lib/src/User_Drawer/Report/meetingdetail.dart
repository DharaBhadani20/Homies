import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class MeetingDetail extends StatefulWidget {
  @override
  _MeetingDetailState createState() => _MeetingDetailState();
}

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class _MeetingDetailState extends State<MeetingDetail> {
  String _meetingsubject, _date, _time, _venue, _description;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("meeting")
        .child("subject")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _meetingsubject = snapshot.value;
        print(_meetingsubject);
      });
    });

    dbref.child("meeting").child("Date").once().then((DataSnapshot snapshot) {
      setState(() {
        _date = snapshot.value;
        print(_date);
      });
    });
    dbref.child("meeting").child("Time").once().then((DataSnapshot snapshot) {
      setState(() {
        _time = snapshot.value;
        print(_time);
      });
    });
    dbref.child("meeting").child("venue").once().then((DataSnapshot snapshot) {
      setState(() {
        _venue = snapshot.value;
        print(_venue);
      });
    });
    dbref
        .child("meeting")
        .child("Description")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _description = snapshot.value;
        print(_description);
      });
    });

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Meeting Details'),
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
                    height: 10,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Meeting Subject:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    _meetingsubject,
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
                    "Date:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    _date,
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
                    "Time:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    _time,
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
                    "Venue:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    _venue,
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
                    "Decription:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Expanded(
                    child: Text(
                      _description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 350,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        // height: 234,
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
                ],
              )
            ],
          ),
        ));
  }
}
