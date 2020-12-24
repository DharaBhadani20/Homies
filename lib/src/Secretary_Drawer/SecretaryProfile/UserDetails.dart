import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserDetailsSecretary extends StatefulWidget {
  @override
  _UserDetailsSecretaryState createState() => _UserDetailsSecretaryState();
}

class _UserDetailsSecretaryState extends State<UserDetailsSecretary> {
  final dbRef = FirebaseDatabase.instance.reference().child("user");

  @override
  Widget build(BuildContext context) {
  
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