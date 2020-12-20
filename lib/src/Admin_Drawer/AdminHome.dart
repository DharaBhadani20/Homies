import 'package:Homies/src/Admin_Drawer/Admin_Drawer.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  String uid;
  AdminHomePage({Key key, @required this.uid}): super(key:key);
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
      String _uid= widget.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Admin Home"),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: AdminDrawer(uid: _uid),
      body: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/Homies.png"),
        ),
      ),
    );
  }
}
