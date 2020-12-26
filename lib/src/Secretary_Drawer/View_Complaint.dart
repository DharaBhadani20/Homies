
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ViewComplaint extends StatefulWidget {
  @override
  _ViewComplaintState createState() => _ViewComplaintState();
}

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class _ViewComplaintState extends State<ViewComplaint> {
   String _ownername, _houseno, _complainttopic, _description, _contactno;

  @override
  Widget build(BuildContext context) {
    dbref
        .child("complaint")
        .child("Owner_Name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _ownername = snapshot.value;
        print(_ownername);
      });
    });

    dbref.child("complaint").child("House_No").once().then((DataSnapshot snapshot) {
      setState(() {
        _houseno = snapshot.value;
        print(_houseno);
      });
    });
    dbref.child("complaint").child("Complaint_Topic").once().then((DataSnapshot snapshot) {
      setState(() {
        _complainttopic = snapshot.value;
        print(_complainttopic);
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
    dbref.child("complaint").child("Contact_No").once().then((DataSnapshot snapshot) {
      setState(() {
        _contactno = snapshot.value;
        print(_contactno);
      });
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Complaint Details'),
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
                      "Owner Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_ownername),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "House No:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_houseno),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complaint Topic:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_complainttopic),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_description),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact No:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_contactno),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ));
  }
}
