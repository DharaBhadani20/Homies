import 'package:Homies/src/Module/ForgotPassword/OTP.dart';
import 'package:Homies/src/Module/Logo/Logo.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class Phone extends StatefulWidget {
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final _phoneController = TextEditingController();

  // Future<bool> phoneLogin() async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Logo(),
            Text(
              'Login With Phone No',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _phoneController,
              // cursorHeight: 25,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: 'Enter Your Phone No.',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(width: 1),
              ),
              color: Colors.grey[400],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTP(),
                  ),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
