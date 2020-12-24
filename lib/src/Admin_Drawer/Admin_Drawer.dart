// import 'package:Homies/src/Admin_Drawer/Add_Remove_Secretary.dart';
import 'package:Homies/src/Admin_Drawer/Profile/AdminProfile.dart';
import 'package:Homies/src/Admin_Drawer/AdminHome.dart';
import 'package:Homies/src/Module/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// ignore: must_be_immutable
class AdminDrawer extends StatefulWidget {
  String uid;
  AdminDrawer({Key key, @required this.uid}) : super(key: key);
  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}
FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

String _fname, _lname;
class _AdminDrawerState extends State<AdminDrawer> {
  @override
  Widget build(BuildContext context) {
    String _uid = widget.uid;
     dbref
        .child("user")
        .child(_uid)
        .child("first_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _fname = snapshot.value;
        print(_fname);
      });
    });
    dbref
        .child("user")
        .child(_uid)
        .child("last_name")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        _lname = snapshot.value;
        print(_lname);
      });
    });
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Row(
                    children: [
                      Text(_fname),
                      SizedBox(width:5,),
                      Text(_lname),
                    ],
                  )),
                ],
              )),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                SizedBox(
                  width: 3,
                ),
                Text('Home'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminHomePage(uid: _uid),
                ),
              );
            },
          ),
          // ListTile(
          //   title: Row(
          //     children: <Widget>[
          //       Icon(Icons.person_add),
          //       SizedBox(
          //         width: 3,
          //       ),
          //       Text('Add Secretary'),
          //     ],
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AddRemoveSecretory(),
          //       ),
          //     );
          //   },
          // ),
          Divider(
            indent: 0,
            color: Colors.grey,
            height: 6,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Report',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.inbox),
                SizedBox(
                  width: 3,
                ),
                Text('Maintenance'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.comment),
                SizedBox(
                  width: 3,
                ),
                Text('Complaint'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.room_service),
                SizedBox(
                  width: 3,
                ),
                Text('Service'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.person_outline),
                SizedBox(
                  width: 3,
                ),
                Text('User'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.person),
                SizedBox(
                  width: 5,
                ),
                Text('Profile'),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminProfilePage(uid: _uid)));
            },
          ),
           ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                SizedBox(
                  width: 3,
                ),
                Text('LogOut'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
            },
          ),
        ],
      ),
      
    );
  }
}
