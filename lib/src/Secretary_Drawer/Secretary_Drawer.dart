import 'package:Homies/src/Secretary/Notice_Board.dart';
import 'package:Homies/src/Secretary_Drawer/Arrange_Meeting.dart';
import 'package:Homies/src/Secretary_Drawer/SecretaryHome.dart';
import 'package:Homies/src/Secretary_Drawer/SecretaryProfile/SecretaryProfile.dart';
import 'package:Homies/src/Secretary_Drawer/MaintenanceDetails.dart';
import 'package:flutter/material.dart';

class SecretaryDrawer extends StatefulWidget {
  @override
  _SecretaryDrawerState createState() => _SecretaryDrawerState();
}

class _SecretaryDrawerState extends State<SecretaryDrawer> {


  @override
  Widget build(BuildContext context) {
   
 
        
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
                              Center(child: Text('Secretory')),
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
                              builder: (context) => SecretaryHomePage(),
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
                        onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.people),
                SizedBox(
                  width: 5,
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
                  builder: (context) => SecretaryProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}