import 'package:Homies/src/User_Drawer/User_Drawer.dart';
import 'package:Homies/src/User_Home/Maintenance/Maintenance.dart';
import 'package:Homies/src/User_Home/Service/Service.dart';
import 'package:Homies/src/User_Home/Service/ViewNotice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference dbref = FirebaseDatabase.instance.reference();

// ignore: must_be_immutable
class Home extends StatefulWidget {
  String uid ;
  Home({Key key, @required this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
 

    String _uid = widget.uid;
    print(_uid);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('User Home'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: UserDrawer(
        uid: _uid,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 7.0, color: Colors.white.withOpacity(1)),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                alignment: Alignment.center,
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey[300]),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300], blurRadius: 5.0)
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Manage',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      height: 10.0,
                      indent: 0.0,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    noticeboard(context),
                    SizedBox(
                      height: 10,
                    ),
                    maintenance(context),
                    SizedBox(
                      height: 10,
                    ),
                    service(context),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.message),
      ),
    );
  }
}

Widget noticeboard(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ViewNotice()));
    },
    child: SizedBox(
      width: 300,
      child: Card(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Icon(Icons.assignment),
              Text('Notice Board'),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget maintenance(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MaintenanceScreen()));
    },
    child: SizedBox(
      width: 300,
      child: Card(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Icon(Icons.add),
              Text('Maintenance'),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget service(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainServiceScreen(),
          ));
    },
    child: SizedBox(
      width: 300,
      child: Card(
        color: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Icon(Icons.room_service),
              Text('Service'),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget message(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
    margin: EdgeInsets.only(top: 10, right: 20),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey[300]),
      boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 5.0)],
    ),
    child: Column(
      children: <Widget>[
        InkWell(onTap: () {}, child: Icon(Icons.chat_bubble)),
        Text('Message'),
      ],
    ),
  );
}
