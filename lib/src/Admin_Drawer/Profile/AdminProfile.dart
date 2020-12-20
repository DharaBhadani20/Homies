import 'package:Homies/src/Admin_Drawer/Admin_Drawer.dart';
import 'package:Homies/src/Admin_Drawer/Profile/AdminEditProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AdminProfilePage extends StatefulWidget {
  // String _uid;
  // AdminProfilePage({this._uid})
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();
String _uid = auth.currentUser.uid;
String _fname;

class _AdminProfilePageState extends State<AdminProfilePage> {
  void getdata() {
    dbref
        .child("User")
        .child(_uid)
        .child("first_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _fname = snapshot.value;
      });
    });
  }

  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              _profilePic(context),
              SizedBox(
                height: 15,
              ),
              _name(context),
              SizedBox(
                height: 15,
              ),
              _phoneNo(context),
              SizedBox(
                height: 50,
              ),
              _editProfileButton(context),
            ],
          ),
        ),
      ),
      drawer: AdminDrawer(),
    );
  }

  Widget _profilePic(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          // child: CircleAvatar(
          //   backgroundColor: Colors.black54,
          //   child: IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          // )
        ),
      ],
    );
  }

  Widget _name(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Align(alignment: Alignment.centerLeft, child: Text(_fname)),
    );
  }

  Widget _phoneNo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Contact No."),
      ),
    );
  }

  Widget _editProfileButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
          color: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminEditProfile(),
              ),
            );
          },
          child: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
