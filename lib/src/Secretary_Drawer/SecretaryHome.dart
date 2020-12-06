import 'package:Homies/src/Secretary_Drawer/Secretary_Drawer.dart';
import 'package:flutter/material.dart';

class SecretaryHomePage extends StatefulWidget {
  @override
  _SecretaryHomePageState createState() => _SecretaryHomePageState();
}

class _SecretaryHomePageState extends State<SecretaryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Secretary Home"),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: SecretaryDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/Homies.png"),
        ),
      ),
    );
  }
}
