import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class AddWatchman extends StatefulWidget {
  @override
  _AddWatchmanState createState() => _AddWatchmanState();
}

class _AddWatchmanState extends State<AddWatchman> {
  String _wname, _number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Watchman Details',
        ),
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
        width: MediaQuery.of(context).size.width,
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
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Name',
                    contentPadding:
                        EdgeInsets.only(top: 18, left: 15, bottom: 18),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onSaved: (value) => _wname = value.trim(),
                  onChanged: (value) => _wname = value.trim(),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Contact No',
                    contentPadding:
                        EdgeInsets.only(top: 18, left: 15, bottom: 18),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  onSaved: (value) => _number = value.trim(),
                  onChanged: (value) => _number = value.trim(),
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 1),
                ),
                onPressed: () {
                  dbref.child('watchman').set({
                    "Watchman_Name": _wname,
                    "Contact_No": _number,
                  });
                  // Navigator.pop(context);
                  print("watchman $_wname : $_number");
                },
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
