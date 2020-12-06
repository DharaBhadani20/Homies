import 'package:Homies/src/Secretary_Drawer/SecretaryProfile/SecretaryEditProfile.dart';
import 'package:Homies/src/Secretary_Drawer/Secretary_Drawer.dart';

import 'package:flutter/material.dart';

class SecretaryProfilePage extends StatefulWidget {
  @override
  _SecretaryProfilePageState createState() => _SecretaryProfilePageState();
}

class _SecretaryProfilePageState extends State<SecretaryProfilePage> {
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
              _address(context),
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
      drawer: SecretaryDrawer(),
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
      child: Align(alignment: Alignment.centerLeft, child: Text("Homies")),
    );
    // return TextField(
    //   cursorHeight: 25,
    //   cursorColor: Colors.grey,
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(30.0),
    //         borderSide: BorderSide(color: Colors.grey)),
    //     focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(30.0),
    //         borderSide: BorderSide(color: Colors.grey)),
    //     hintText: 'Name',
    //     prefixIcon: Icon(
    //       Icons.person,
    //       color: Colors.grey,
    //     ),
    //   ),
    // );
  }

  Widget _address(BuildContext context) {
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
        child: Text("Address"),
      ),
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
                builder: (context) => SecretaryEditProfile(),
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
