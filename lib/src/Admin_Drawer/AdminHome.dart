import 'package:Homies/src/Admin_Drawer/Admin_Drawer.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
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
      drawer: AdminDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/Homies.png"),
        ),
      ),
    );
  }
}
