import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class AddComplaint extends StatefulWidget {
  @override
  _AddComplaintState createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {
  String _ownername, _houseno, _complainttopic, _description, _contactno;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Complaint',
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
        height: MediaQuery.of(context).size.height,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ownreName(context),
                houseNo(context),
                complaint(context),
                description(context),
                contact(context),
                saveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ownreName(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Owner Name',
          contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSaved: (value) => _ownername = value.trim(),
        onChanged: (value) => _ownername = value.trim(),
      ),
    );
  }

  Widget houseNo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'House No.',
          contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSaved: (value) => _houseno = value.trim(),
        onChanged: (value) => _houseno = value.trim(),
      ),
    );
  }

  Widget complaint(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Complaint Topic',
          contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSaved: (value) => _complainttopic = value.trim(),
        onChanged: (value) => _complainttopic = value.trim(),
      ),
    );
  }

  Widget description(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Description',
          contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSaved: (value) => _description = value.trim(),
        onChanged: (value) => _description = value.trim(),
      ),
    );
  }

  Widget contact(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Contact No.',
          contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        onSaved: (value) => _contactno = value.trim(),
        onChanged: (value) => _contactno = value.trim(),
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 1),
        ),
        onPressed: () {
          dbref.child('complaint').set({
            "Owner_Name": _ownername,
            "House_No": _houseno,
            "Complaint_Topic": _complainttopic,
            "Description": _description,
            "Contact_No": _contactno,
          });
          // Navigator.pop(context);
          print(
              "complaint $_ownername : $_houseno : $_complainttopic : $_description : $_contactno");
        },
        child: Text(
          'Save',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
