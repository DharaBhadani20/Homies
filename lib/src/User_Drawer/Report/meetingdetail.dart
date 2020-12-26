import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

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
        backgroundColor: Colors.white,
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
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meeting Subject:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_meetingsubject),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_date),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_time),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Venue:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_venue),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Decription:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_description),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ));
  }
}
