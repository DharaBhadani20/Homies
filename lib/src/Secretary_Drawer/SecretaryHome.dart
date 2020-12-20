import 'package:Homies/src/Secretary_Drawer/Secretary_Drawer.dart';
import 'package:flutter/material.dart';

class SecretaryHomePage extends StatefulWidget {
  String uid;
  SecretaryHomePage({Key key, @required this.uid}) : super(key: key);
  @override
  _SecretaryHomePageState createState() => _SecretaryHomePageState();
}

class _SecretaryHomePageState extends State<SecretaryHomePage> {
  @override
  Widget build(BuildContext context) {
    String _uid = widget.uid;
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
      drawer: SecretaryDrawer(
        uid: _uid,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/Homies.png"),
        ),
      ),
    );
  }
}
