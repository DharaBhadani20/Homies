import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class Vehical extends StatefulWidget {
  @override
  _VehicalState createState() => _VehicalState();
}

class _VehicalState extends State<Vehical> {
  String _vehicaltype, _noofvehical,_vownername;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Vehical Details',
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
                vehicalnumber(context),
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
        onSaved: (value) => _vownername = value.trim(),
        onChanged: (value) => _vownername = value.trim(),
      ),
    );
  }

 Widget vehicalnumber(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 20),
      // child: TextFormField(
      //   cursorColor: Colors.grey,
      //   cursorHeight: 25,
      //   keyboardType: TextInputType.number,
      //   decoration: InputDecoration(
      //     fillColor: Colors.white,
      //     filled: true,
          // hintText: 'Number of Vehical',
      //     contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: 5),
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(25.0),
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(25.0),
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //   ),
      //   onSaved: (value) => _noofvehical= value.trim(),
      //   onChanged: (value) => _noofvehical = value.trim(),
      // ),

           child:     DropdownButton<String>(
                  value: _vehicaltype,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 22,
                
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      _vehicaltype = newValue;
                    });
                  },
                  items: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
          dbref.child('vehical').set({
            "Owner_Name": _vownername,
            "number_of_vehical": _noofvehical,
            
          });
          // Navigator.pop(context);
          print(
              "vehical $_vownername : $_noofvehical");
        },
        child: Text(
          'Save',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
