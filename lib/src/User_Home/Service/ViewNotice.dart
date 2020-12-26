import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class ViewNotice extends StatefulWidget {
  @override
  _ViewNoticeState createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  String _topic , _description ,_date;
 

  

  @override
  Widget build(BuildContext context) {
    dbref
        .child("Notice")
        .child("Topic")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _topic = snapshot.value;
        print(_topic);
      });
    });
     dbref
        .child("Notice")
        .child("Date")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _description = snapshot.value;
        print(_date);
      });
    });
     dbref
        .child("Notice")
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
          title: Text('Notice'),
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
                      "Topic:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_topic),
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
