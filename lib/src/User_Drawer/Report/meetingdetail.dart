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

      dbref
        .child("meeting")
        .child("Date")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _date = snapshot.value;
        print(_date);

      });
    });
      dbref
        .child("meeting")
        .child("Time")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _time = snapshot.value;
        print(_time);

      });
    });
      dbref
        .child("meeting")
        .child("Venue")
        .once()
        .then((DataSnapshot snapshot) {
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
    body:Container(
      child:
       Column(
         children: [
           Text(_meetingsubject),
            Text(_date),
            Text(_time),
            Text(_venue),
            Text(_description)
         ],
       ),
       )   
    
    );
  }
}
