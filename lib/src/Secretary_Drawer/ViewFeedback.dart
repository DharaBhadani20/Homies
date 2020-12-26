import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FeedbackDetail extends StatefulWidget {
  @override
  _FeedbackDetailState createState() => _FeedbackDetailState();
}

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class _FeedbackDetailState extends State<FeedbackDetail> {
  String _feedbacktopic, _description;
  @override
  Widget build(BuildContext context) {
    dbref
        .child("GiveFeedback")
        .child("FeedbackTopic")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _feedbacktopic = snapshot.value;
        print(_feedbacktopic);
      });
    });
    dbref
        .child("GiveFeedback")
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
          title: Text('Feedback Details'),
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
                      "Feedback Topic:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_feedbacktopic),
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
