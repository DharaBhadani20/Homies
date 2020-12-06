import 'package:flutter/material.dart';

class AddRemoveSecretory extends StatefulWidget {
  @override
  _AddRemoveSecretoryState createState() => _AddRemoveSecretoryState();
}

class _AddRemoveSecretoryState extends State<AddRemoveSecretory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add Secretary',
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
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                fname(context),
                mname(context),
                lname(context),
                contact(context),
                houseNo(context),
                addorremove(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fname(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'First Name',
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
      ),
    );
  }

  Widget mname(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Middle Name',
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
      ),
    );
  }

  Widget lname(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Last Name',
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
      ),
    );
  }

  Widget contact(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: Colors.grey,
        // cursorHeight: 25,
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
      ),
    );
  }

  Widget houseNo(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      // cursorHeight: 25,
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
    );
  }

  Widget addorremove(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          Text(
            'Add or Remove Secretary ?',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('Yes'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('No'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
