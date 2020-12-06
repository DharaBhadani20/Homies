import 'package:flutter/material.dart';

class PayMaintenance extends StatefulWidget {
  @override
  _PayMaintenanceState createState() => _PayMaintenanceState();
}

class _PayMaintenanceState extends State<PayMaintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Maintenance',
          style: TextStyle(color: Colors.white),
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
              children: <Widget>[Text('Monthly Maintenance'), amount(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget amount(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Rs.....',
          contentPadding: EdgeInsets.only(top: 20, left: 15, bottom: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
