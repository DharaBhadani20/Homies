import 'package:Homies/src/Module/Login/Login.dart';
import 'package:Homies/src/Secretary/Notice_Board.dart';
import 'package:Homies/src/Secretary_Drawer/Arrange_Meeting.dart';
import 'package:Homies/src/Secretary_Drawer/SecretaryHome.dart';
import 'package:Homies/src/Secretary_Drawer/SecretaryProfile/SecretaryProfile.dart';
import 'package:Homies/src/Secretary_Drawer/MaintenanceDetails.dart';
import 'package:Homies/src/Secretary_Drawer/View_Complaint.dart';
import 'package:Homies/src/Secretary_Drawer/ViewFeedback.dart';
import 'package:Homies/src/User_Drawer/Report/meetingdetail.dart';
import 'package:Homies/src/Secretary_Drawer/add_watchman.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Homies/src/authentication.dart';

// ignore: must_be_immutable
class SecretaryDrawer extends StatefulWidget {
  String uid;
  final BaseAuth bauth;
  SecretaryDrawer({Key key, @required this.uid, this.bauth}) : super(key: key);
  @override
  _SecretaryDrawerState createState() => _SecretaryDrawerState();
}

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

String _fname, _lname;

class _SecretaryDrawerState extends State<SecretaryDrawer> {
  signOut() async {
    try {
      await widget.bauth.signOut();
    } catch (e) {
      print(e);
    }
  }

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
        // print(_fname);
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
        // print(_lname);
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
                  Center(
                      child: Row(
                    children: [
                      Text(_fname),
                      SizedBox(
                        width: 5,
                      ),
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
                  builder: (context) => SecretaryHomePage(
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            indent: 0,
            color: Colors.grey,
            height: 6,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.add_comment),
                SizedBox(
                  width: 5,
                ),
                Text('Maintenance Details'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MaintenanceDetails(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.add),
                SizedBox(
                  width: 5,
                ),
                Text('View Complaint'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewComplaint(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.room_service),
                SizedBox(
                  width: 5,
                ),
                Text('Service'),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.event_available),
                SizedBox(
                  width: 5,
                ),
                Text('Arrange Meeting'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArrangeMeeting(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.event),
                SizedBox(
                  width: 5,
                ),
                Text('View Meeting Details'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeetingDetail(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.assignment),
                SizedBox(
                  width: 5,
                ),
                Text('Update Notice'),
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoticeBoard()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.feedback),
                SizedBox(
                  width: 5,
                ),
                Text('View Feedback'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedbackDetail(),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.add),
                SizedBox(
                  width: 5,
                ),
                Text('Add Watchman details'),
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AddWatchman(),),);
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
                  builder: (context) => SecretaryProfilePage(
                    uid: _uid,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                SizedBox(
                  width: 5,
                ),
                Text('LogOut'),
              ],
            ),
            onTap: () {
              signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
              print("Logout");
              //      await widget.bauth.signOut();

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
