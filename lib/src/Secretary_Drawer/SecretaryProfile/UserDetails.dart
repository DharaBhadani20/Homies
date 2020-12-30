import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

class UserDetailsSecretary extends StatefulWidget {
  @override
  _UserDetailsSecretaryState createState() => _UserDetailsSecretaryState();
}

class _UserDetailsSecretaryState extends State<UserDetailsSecretary> {
  
String _userEmail,
      _fname,
      _mname,
      _lname,
      _houseid,
      _address,
      _contact;

  @override
  Widget build(BuildContext context) {
    dbref
        .child("Secretary")
        .child("House_No")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _houseid = snapshot.value;
        print(_houseid);
      });
    });
     dbref
        .child("Secretary")
        .child("first_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _fname = snapshot.value;
        print(_fname);
      });
    });
     dbref
        .child("Secretary")
        .child("last_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _lname = snapshot.value;
        print(_lname);
      });
    });
     dbref
        .child("Secretary")
        .child("middle_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _mname = snapshot.value;
        print(_mname);
      });
    });
    dbref
        .child("Secretary")
        .child("email")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _userEmail = snapshot.value;
        print(_userEmail);
      });
    });
    
    dbref
        .child("Secretary")
        .child("address")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _address = snapshot.value;
        print(_address);
      });
    });
    
    dbref
        .child("Secretary")
        .child("contact")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _contact = snapshot.value;
        print(_contact);
      });
    });
  
  return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('User Details'),
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
                      "House No:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_houseid),
                  ],
                ),
                SizedBox(height: 5),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),Text(_fname),Text(_mname),Text(_lname),
                     
                   
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Id:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_userEmail),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(_address),
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
                    Text(_contact),
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ));

    // return FutureBuilder(
    // future: dbRef.once(),
    // builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
    //     if (snapshot.hasData) {
          
    //      lists.clear();
    //     Map<dynamic, dynamic> values = snapshot.data.value;
    //     values.forEach((key, values) {
    //         lists.add(values);
    //     });
    //     return new ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: lists.length,
    //         itemBuilder: (BuildContext context, int index) {
    //             return Card(
    //             child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                 Text("Name: " + lists[index]["_fname"]),
    //                 Text("Address: "+ lists[index]["_address"]),
    //                 Text("Contact: " +lists[index]["_contact"]),
    //                 ],
    //             ),
    //             );
    //         });
    //     }
    //     return CircularProgressIndicator();
    // });

  }
}