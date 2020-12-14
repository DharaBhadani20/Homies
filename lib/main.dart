
// import 'package:Homies/splashscreen.dart';

import 'package:Homies/src/rootpage.dart';
import 'package:Homies/src/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      home: new RootPage(auth: new Auth()),
      debugShowCheckedModeBanner: false,
    );
  }
}