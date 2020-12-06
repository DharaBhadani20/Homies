import 'dart:async';
import 'package:Homies/src/Module/Login/Login.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // initState() {
  //   FirebaseAuth.instance
  //       .currentUser()
  //       .then((currentUser) => {
  //             if (currentUser == null)
  //               {
  //                 Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => Login()),
  //                     (route) => false),
  //               }
  //             else
  //               {
  //                 FirebaseFirestore.instance
  //                     .collection("users")
  //                     .doc(currentUser.uid)
  //                     .get()
  //                     .then((DocumentSnapshot result) =>
  //                         Navigator.pushReplacement(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (context) => Home(
  //                                       title: result["fname"] + "'s Tasks",
  //                                       uid: currentUser.uid,
  //                                     ))))
  //                     .catchError((err) => print(err))
  //               }
  //           })
  //       .catchError((err) => print(err));
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Image(
        image: AssetImage("assets/images/Homies.png"),
      ),
    );
  }
}
