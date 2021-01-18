import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

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

    dbref
        .child("complaint")
        .child("House_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _houseno = snapshot.value;
        print(_houseno);
      });
    });
    dbref
        .child("complaint")
        .child("Complaint_Topic")
        .once()
        .then((DataSnapshot snapshot) {
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
    dbref
        .child("complaint")
        .child("Contact_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _contactno = snapshot.value;
        print(_contactno);
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
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
        height: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),

        body: Container(
          height: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey[400],
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Owner Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _ownername,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "House No:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _houseno,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Complaint Topic:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _complainttopic,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Description:",
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
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Contact No:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _contactno,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 400,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 208,
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
      ),
    );
  }
}
