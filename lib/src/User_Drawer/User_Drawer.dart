import 'package:Homies/src/Module/Login/Login.dart';
import 'package:Homies/src/User_Drawer/Report/Add_Complaint.dart';
import 'package:Homies/src/User_Drawer/Report/Profile/UserProfilePage.dart';
import 'package:Homies/src/User_Home/Home.dart';
import 'package:Homies/src/User_Drawer/GiveFeedback.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

// ignore: must_be_immutable
class UserDrawer extends StatefulWidget {
  String uid;
  UserDrawer({Key key, @required this.uid}) : super(key: key);
  @override
  _UserDrawerState createState() => _UserDrawerState();
}
FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

String _fname, _lname;





class _UserDrawerState extends State<UserDrawer> {
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
                  builder: (context) => Home(
                    uid: _uid,
                  ),
                ),
              );
            },
          ),
          Divider(
            indent: 0,
            color: Colors.grey,
            height: 6,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Report',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.add),
                SizedBox(
                  width: 5,
                ),
                Text('Add Complaint'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddComplaint(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.event_available),
                SizedBox(
                  width: 5,
                ),
                Text('View Meeting Details'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.feedback),
                SizedBox(
                  width: 5,
                ),
                Text('Give Feedback'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GiveFeedback(),
                ),
              );
            },
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
                  builder: (context) => UserProfilePage(
                    uid: _uid,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 300,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.lock),
                SizedBox(
                  width: 5,
                ),
                Text('Log Out'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
