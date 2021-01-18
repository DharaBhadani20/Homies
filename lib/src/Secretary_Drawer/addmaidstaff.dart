import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class AddMaidStaff extends StatefulWidget {
  @override
  _AddMaidStaffState createState() => _AddMaidStaffState();
}

class _AddMaidStaffState extends State<AddMaidStaff> {
  String _m1name, _m1number,_m2name,_m2number,_m3number,_m3name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Maid Staff Details',
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
                    hintText: 'maid 1 name',
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
                  onSaved: (value) => _m1name = value.trim(),
                  onChanged: (value) => _m1name = value.trim(),
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
                  onSaved: (value) => _m1number = value.trim(),
                  onChanged: (value) => _m1number = value.trim(),
                )
                ),
            
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Maid 2 Name',
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
                  onSaved: (value) => _m2name = value.trim(),
                  onChanged: (value) => _m2name = value.trim(),
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
                  onSaved: (value) => _m2number = value.trim(),
                  onChanged: (value) => _m2number = value.trim(),
                )
                ),
                Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: ' Maid 3 Name',
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
                  onSaved: (value) => _m3name = value.trim(),
                  onChanged: (value) => _m3name = value.trim(),
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
                  onSaved: (value) => _m3number = value.trim(),
                  onChanged: (value) => _m3number = value.trim(),
                )
                ),
                Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(width: 1),
                ),
                onPressed: () {
                  dbref.child('maid').set({
                    "Maid1_Name": _m1name,
                    "Maid1_Contact_No": _m1number,
                      "Maid2_Name": _m2name,
                    "Maid2_Contact_No": _m2number,
                      "Maid3_Name": _m3name,
                    "Maid3_Contact_No": _m3number,
                  });
                  // Navigator.pop(context);
                  // print("watchman $_maidname : $_maidnumber");
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
